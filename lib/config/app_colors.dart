import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Colors.green;
  static const Color nav = Color(0xfffbfbfb);
  static const Color page = Color(0xfffbfbfb);
  static const Color divider = Color(0xffa8a8a8);

  static const Color c7B7B7B = Color(0xff7b7b7b);
  static const Color c8D8D8D = Color(0xff8b8b8b);
  static const Color cB1B1B1 = Color(0xffb1b1b1);
  static const Color cF7F7F7 = Color(0xfff7f7f7);
  static const Color cFbFbFb = Color(0xfffbfbfb);
  static const Color cF5F5F5 = Color(0xfff5f5f5);


  /// 颜色值转换
  static Color stringColor(String colorString) {
    int value = 0x00000000;
    if (colorString.isNotEmpty) {
      if (colorString[0] == "#") {
        colorString = colorString.substring(1);
      }
      value = int.tryParse(colorString, radix: 16);
      if (value != null) {
        if (value < 0xFF000000) {
          value += 0xFF000000;
        }
      }
    }
    return Color(value);
  }
}
