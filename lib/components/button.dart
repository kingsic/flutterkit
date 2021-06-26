import 'package:flutter/material.dart';

class ButtonStyleConfig {
  /// 文本样式
  final TextStyle textStyle;

  /// 大小
  final Size size;

  /// 边框页
  final BorderSide borderSide;

  /// 圆角半径，默认为：BorderRadius.zero
  final BorderRadiusGeometry borderRadius;

  /// 阴影值，默认为：0.0
  final double elevation;

  /// 阴影颜色
  final Color shadowColor;

  /// 水波纹颜色，默认为：Colors.transparent
  final Color overlayColor;

  /// 前景颜色，默认为：Colors.black
  final Color foregroundColor;

  /// 按下时的前景颜色，默认为：foregroundColor
  final Color pressedForegroundColor;

  /// 背景颜色，默认为：Colors.transparent
  final Color backgroundColor;

  /// 按下时的背景颜色，默认为：backgroundColor
  final Color pressedBackgroundColor;

  const ButtonStyleConfig({
    this.textStyle,
    this.size,
    this.borderSide,
    this.borderRadius = BorderRadius.zero,
    this.elevation = 0.0,
    this.shadowColor,
    this.overlayColor = Colors.transparent,
    this.foregroundColor = Colors.black,
    this.pressedForegroundColor,
    this.backgroundColor = Colors.transparent,
    this.pressedBackgroundColor,
  });
}

class Button extends StatelessWidget {
  /// 子组件
  final Widget child;

  /// 样式配置类
  final ButtonStyleConfig config;

  /// 按下回调
  final VoidCallback onPressed;

  /// 长按回调
  final VoidCallback onLongPress;

  Button({
    this.child,
    this.config = const ButtonStyleConfig(),
    this.onPressed,
    this.onLongPress,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: child,
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(config.textStyle),
        minimumSize: MaterialStateProperty.all(config.size),
        elevation: MaterialStateProperty.all(config.elevation),
        shadowColor: MaterialStateProperty.all(config.shadowColor),
        overlayColor: MaterialStateProperty.all(config.overlayColor),
        side: MaterialStateProperty.all(config.borderSide),
        /// RoundedRectangleBorder、BeveledRectangleBorder、StadiumBorder
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: config.borderRadius)),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            // 按下按钮时文字颜色
            return config.pressedForegroundColor ?? config.foregroundColor;
          }
          // 默认状态下按钮文字颜色
          return config.foregroundColor;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return config.pressedBackgroundColor ?? config.backgroundColor;
          }
          return config.backgroundColor;
        }),
      ),
    );    
  }
}
