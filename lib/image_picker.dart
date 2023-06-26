// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_service/constants.dart';
import 'package:image_picker_service/permissions.dart';

class ImagePickerService {
  /// Return a [File] object pointing to the image that was picked.
  Future<PickedFile> pickImage({required ImageSource source}) async {
    final xFileSource = await ImagePicker().pickImage(
      source: source,
      // maxHeight: 200,
      // maxWidth: double.infinity,
      // imageQuality: 60,
    );
    return PickedFile(xFileSource!.path);
  }

  Future<File?> chooseImageFile(BuildContext context) async {
    try {
      return await showModalBottomSheet(
          context: context, builder: (builder) => bottomSheet(context));
    } catch (e) {
      printlng("The error is in image picker service ......$e");
    }
    return null;
  }

  Widget bottomSheet(BuildContext context) {
    ///
    Future<void> openSource(ImageSource source) async {
      final file = await pickImage(source: source);
      File selected = File(file.path);
      if (await selected.exists()) {
        Navigator.pop(context, selected);
      } else {
        Navigator.pop(context, File(''));
      }
    }

    var styleFs12Fw600 = const TextStyle(
      fontSize: 14,
      letterSpacing: 0.02,
      fontWeight: FontWeight.w600,
    );

    ///
    /// Bottom Sheet Styling
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text("Choose Image File", style: styleFs12Fw600),
          Utils.horizontalSpacer(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  final bool cameraStatus =
                      await GetPermissions.getCameraPermission();

                  if (cameraStatus) {
                    openSource(ImageSource.camera);
                  }
                },
                child: Column(
                  children: [
                    const Icon(Icons.camera_alt, size: 22),
                    Text("Camera", style: styleFs12Fw600)
                  ],
                ),
              ),
              const SizedBox(width: 1),
              InkWell(
                onTap: () async {
                  final bool galleryStatus =
                      await GetPermissions.getStoragePermission();

                  if (galleryStatus) {
                    openSource(ImageSource.gallery);
                  }
                },
                child: Column(
                  children: [
                    const Icon(Icons.image, size: 22),
                    Text("Gallery", style: styleFs12Fw600)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
