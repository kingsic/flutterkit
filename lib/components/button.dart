import 'package:flutter/material.dart';

typedef ButtonTapCallback = void Function();

class Button extends StatelessWidget {
  /// 文本数据
  final String data;

  /// 文本样式
  final TextStyle style;

  /// 宽度
  final double width;

  /// 高度
  final double height;

  /// 背景颜色
  final Color backgroundColor;

  /// 圆角（BorderRadius.circular(_) or BorderRadius.only(topLeft: Radius.circular(_)））
  final BorderRadius borderRadius;

  /// 边框宽度，默认为：0.5
  final double borderWidth;

  /// 边框颜色，默认为：Colors.transparent
  final Color borderColor;

  /// 点击回调函数
  final ButtonTapCallback onTap;

  const Button(
    this.data, {
    Key key,
    this.style,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.borderWidth = 0.5,
    this.borderColor = Colors.transparent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: Text("$data", style: style),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: Border.all(width: borderWidth, color: borderColor),
          ),
        ),
        onTap: onTap
    );
  }
}
