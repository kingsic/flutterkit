import 'package:flutter/services.dart';

class NumberLimitInputFormatter extends TextInputFormatter {
  /// 限制小数点后几位，默认为：2，小数点后2位
  final int limitDecimal;
  /// 不能以什么开始，默认为：00
  final String noStart;

  NumberLimitInputFormatter({
    this.limitDecimal = 2,
    this.noStart = "00"
  });

  RegExp _exp = RegExp("[0-9.]");
  // 小数点
  static const String _decimal = ".";

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

    // 不能以“00”开头
    if (newValue.text.startsWith(noStart)) {
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