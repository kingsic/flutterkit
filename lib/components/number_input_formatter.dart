import 'package:flutter/services.dart';

class NumberInputFormatter extends TextInputFormatter {
  /// 是否仅支持数字输入，默认为：false，也可输入小数点
  final bool digitsOnly;
  /// 保留几位小数，默认为：2
  final int decimalPlaces;
  /// 不能以什么开头，默认为："00"
  final String noStarts;

  NumberInputFormatter({
    this.digitsOnly = false,
    this.decimalPlaces = 2,
    this.noStarts = "00"
  });

  // 小数点
  static const String _decimal = ".";
  RegExp _digitsOnlyRegExp = RegExp("^[0-9]+\$");
  RegExp _decimalRegExp = RegExp("^[0-9\.]+\$");

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // 输入完全删除
    if (newValue.text.isEmpty) {
      return TextEditingValue();
    }

    /// 可以输入小数点
    if (digitsOnly == false) {
      if (!(_decimalRegExp.hasMatch(newValue.text))) {
        return oldValue;
      }

      if (newValue.text.startsWith(noStarts)) {
        return oldValue;
      }

      /// 包含小数点的情况处理
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
        if (lengthAfterPointer > decimalPlaces) {
          return oldValue;
        }
      }

      return newValue;

    } else { /// 不可输入小数点
      if (!_digitsOnlyRegExp.hasMatch(newValue.text)) {
        return oldValue;
      }

      if (newValue.text.startsWith(noStarts)) {
        return oldValue;
      }

      return newValue;
    }
  }
}
