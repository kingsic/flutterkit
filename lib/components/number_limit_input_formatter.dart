import 'package:flutter/services.dart';

class NumberLimitInputFormatter extends TextInputFormatter {
  /// 限制小数点后几位，默认为：2，小数点后2位
  int limitDecimal;

  NumberLimitInputFormatter({
    this.limitDecimal = 2,
  });

  RegExp _exp = RegExp("[0-9.]");
  // 小数点
  static const String _decimal = ".";
  // 不能以0开头
  static const String _no_start = "0";

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // 输入完全删除
    if (newValue.text.isEmpty) {
      return TextEditingValue();
    }

    // 只允许输入小数
    if (!_exp.hasMatch(newValue.text)) {
      return oldValue;
    }

    // 不能以小数点、“0”开头
    if (newValue.text.startsWith(_decimal) || newValue.text.startsWith(_no_start)) {
      return oldValue;
    }

    // 包含小数点的情况
    if (newValue.text.contains(_decimal)) {
      // 包含多个小数
      if (newValue.text.indexOf(_decimal) != newValue.text.lastIndexOf(_decimal)) {
        return oldValue;
      }
      String input = newValue.text;
      int index = input.indexOf(_decimal);

      // 小数点后位数
      int lengthAfterPointer = input.substring(index, input.length).length - 1;

      // 小数位大于限制数
      if (lengthAfterPointer > limitDecimal) {
        return oldValue;
      }
    }
    return newValue;
  }
}