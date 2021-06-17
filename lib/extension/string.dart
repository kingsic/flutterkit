extension emptyExt on String {
  /// 判断字符串是否为空或为null
  ///
  /// 返回为 true 时，则表示为空或为null
  ///
  /// 返回为 false 时，则表示有值
  bool isEmptyOrNull() {
    if (this.isEmpty || this == null) {
      return true;
    } else {
      return false;
    }
  }
}

extension phoneNumberExt on String {
  /// 大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
  ///
  /// 此方法中前三位格式有：
  /// 13+任意数、145、147、15+除4外的任意数、166、17+除9外的任意数、18+任意数、198、199
  bool isPhoneNumber() {
    return RegExp('^((13[0-9])|(147,145)|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9]))\\d{8}\$').hasMatch(this);
  }
}