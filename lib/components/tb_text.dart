import 'package:flutter/material.dart';

class TBText extends StatelessWidget {
  /// 顶部文本数据
  final String topData;

  /// 顶部文本样式
  final TextStyle topStyle;

  /// 顶部文本溢流样式
  final TextOverflow topOverflow;

  /// 顶部文本行数，默认为：1
  final int topMaxLines;

  /// 底部文本数据
  final String bottomData;

  /// 底部文本样式
  final TextStyle bottomStyle;

  /// 底部文本溢流样式
  final TextOverflow bottomOverflow;

  /// 底部文本行数，默认为：1
  final int bottomMaxLines;

  /// 颜色
  final Color color;

  /// 宽度
  final double width;

  /// 高度
  final double height;

  /// 内边距，默认上下左右间距都是 5
  final EdgeInsetsGeometry padding;

  /// 顶部与底部文本之间的间距
  final double spacing;

  /// 主轴对齐样式，默认为：center
  final MainAxisAlignment mainAxisAlignment;

  /// 横轴对齐样式，默认为：start
  final CrossAxisAlignment crossAxisAlignment;

  const TBText(this.topData, this.bottomData, {
    Key key,
    this.topStyle,
    this.topOverflow,
    this.topMaxLines = 1,
    this.bottomStyle,
    this.bottomOverflow,
    this.bottomMaxLines = 1,
    this.color,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(5),
    this.spacing,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: color,
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("$topData", style: topStyle, overflow: topOverflow, maxLines: topMaxLines,),
          SizedBox(height: spacing),
          Text("$bottomData", style: bottomStyle, overflow: bottomOverflow, maxLines: bottomMaxLines,),
        ],
      ),
    );
  }
}
