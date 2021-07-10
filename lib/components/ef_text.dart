import 'package:flutter/material.dart';

class TextConfig {
  /// 样式
  final TextStyle style;

  /// 对齐方式
  final TextAlign textAlign;

  /// 溢出样式
  final TextOverflow overflow;

  /// 最大行数
  final int maxLines;

  /// 左边距，默认为：0。0
  final double indent;

  /// 右边距离，默认为：0。0
  final double endIndent;

  /// 是否需要 Expanded 包裹
  final bool expanded;

  const TextConfig({
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.expanded = false
  });
}

/// Expanded 或 Flexible 包裹的 Text
class EFText extends StatelessWidget {
  /// 文本数据
  final String data;

  /// 文本配置类
  final TextConfig config;

  /// 左侧 Widget
  final Widget leading;

  /// 右侧 Widget
  final Widget trailing;

  /// 颜色
  final Color color;

  /// 宽度
  final double width;

  /// 高度
  final double height;

  /// margin
  final EdgeInsetsGeometry margin;

  /// padding
  final EdgeInsetsGeometry padding;

  /// alignment，默认为：Alignment.center
  final AlignmentGeometry alignment;

  /// 圆角
  final BorderRadius borderRadius;

  /// 边框（Border.all()）
  final BoxBorder border;

  /// 渐变色
  final Gradient gradient;
  
  /// 点击回调函数
  final VoidCallback onTap;

  EFText(this.data, {
    this.config = const TextConfig(),
    this.leading,
    this.trailing,
    this.color,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.border,
    this.gradient,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          border: border,
          gradient: gradient,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null)
              leading,

            SizedBox(width: config.indent),
            config.expanded == true ? expandedText() : flexibleText(),
            SizedBox(width: config.endIndent),

            if (trailing != null)
              trailing
          ],
        ),
      ),
    );
  }

  Widget flexibleText() {
    return Flexible(
        child: Text("$data",
          style: config.style,
          textAlign: config.textAlign,
          overflow: config.overflow,
          maxLines: config.maxLines,
        )
    );
  }

  Widget expandedText() {
    return Expanded(
        child: Text("$data",
          style: config.style,
          textAlign: config.textAlign,
          overflow: config.overflow,
          maxLines: config.maxLines,
        )
    );
  }

}
