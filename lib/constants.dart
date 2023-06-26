// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
///
/// Flutter Utilities

class Utils {
  ///
  static flutterToast(String text) {
    return Fluttertoast.showToast(msg: text);
  }

  static horizontalSpacer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Container(
        height: 1,
        color: const Color(0xFFcfcfcf).withOpacity(0.5),
      ),
    );
  }
}

///
///
/// Flutter Constants
const DUMMY_PROFILE_PICTURE = 'https://i.stack.imgur.com/l60Hf.png';

///
///
/// Method to print really long 'String'
void printlng(String text) {
  debugPrint(text, wrapWidth: 1024);
}
