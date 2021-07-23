extension toStringExtension on List {
  /// 数组转字符串的拓展方法
  ///
  /// split：元素之间的分割方式，默认为：""
  String toStringExt({String split = ""}) {
    if (this.length == 0) {
      return "";
    }
    String result;
    this.forEach((element) {
      if (result == null) {
        result = "$element";
      } else {
        result = "$result$split$element";
      }
    });
    return result;
  }
}