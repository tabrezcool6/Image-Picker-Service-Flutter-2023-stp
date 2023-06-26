import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_service/constants.dart';
import 'package:image_picker_service/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;

  final imagePickerService = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: image != null
                      ? Image.file(image!).image
                      : const NetworkImage(DUMMY_PROFILE_PICTURE),
                  backgroundColor: Colors.grey,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () async {
                      image = await imagePickerService.chooseImageFile(context);

                      image == null
                          ? Utils.flutterToast("Image Not Picked")
                          : setState(() {});
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
