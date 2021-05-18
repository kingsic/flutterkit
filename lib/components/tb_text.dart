import 'package:flutter/material.dart';

class TBText extends StatelessWidget {
  /// 顶部文本内容
  final String topData;

  /// 顶部文本样式
  final TextStyle topStyle;

  /// 底部文本内容
  final String bottomData;

  /// 底部文本样式
  final TextStyle bottomStyle;

  /// 背景颜色，默认为：Colors.transparent
  final Color backgroundColor;

  /// 顶部与底部文本之间的间距
  final double tbSpacing;

  /// 内边距，默认上下左右间距都是 5
  final EdgeInsetsGeometry padding;

  /// 主轴对齐样式，默认居左
  final MainAxisAlignment mainAxisAlignment;

  /// 横轴对齐样式，默认居左
  final CrossAxisAlignment crossAxisAlignment;

  const TBText(this.topData, this.bottomData, {
    Key key,
    this.topStyle,
    this.bottomStyle,
    this.backgroundColor = Colors.transparent,
    this.tbSpacing,
    this.padding = const EdgeInsets.all(5),
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text("$topData", style: topStyle),
          SizedBox(height: tbSpacing),
          Text("$bottomData", style: bottomStyle),
        ],
      ),
    );
  }
}
