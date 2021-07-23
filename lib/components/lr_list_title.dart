import 'package:flutter/material.dart';

class DividerConfig {
  /// 分割线颜色，默认为：Color(0xffeeeeee)
  final Color color;

  /// 分割线高度，默认为：1.0
  final double height;

  /// 分割线距左边间距，默认为：0.0
  final double indent;

  /// 分割线距右边边距，默认为：0.0
  final double endIndent;

  DividerConfig({
    this.color = const Color(0xffeeeeee),
    this.height = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });
}

class LRListTitle extends StatefulWidget {
  /// 左侧 Widget
  final Widget leading;

  /// 左侧 Widget 距左边间距，默认为：20
  final double leadingIndent;

  /// 标题文本数据
  final String data;

  /// 标题文本样式
  final TextStyle style;

  /// 标题左侧间距，默认为：20
  final double titleIndent;

  /// 标题右侧间距，默认为：10
  final double titleEndIndent;

  /// 标题右侧 Widget
  final Widget titleTrailing;

  /// 子标题文本数据
  final String subData;

  /// 子标题文本样式
  final TextStyle subStyle;

  /// 子标题右侧间距，默认为：20
  final double subTitleEndIndent;

  /// 右侧 Widget
  final Widget trailing;

  /// 右侧 Widget 距右边间距，默认为：20
  final double trailingEndIndent;

  /// 分割线相关配置
  final DividerConfig dividerConfig;

  /// 高度，默认为：44
  final double height;

  /// 颜色，默认为：Colors.white
  final Color color;

  /// 圆角，默认为：BorderRadius.zero
  final BorderRadiusGeometry borderRadius;

  /// 点击回调函数
  final GestureTapCallback onTap;

  /// 长按回调函数
  final GestureTapCallback onLongPress;

  const LRListTitle(
    this.data, {
    Key key,
    this.leading,
    this.leadingIndent = 20,
    this.style,
    this.titleIndent = 20,
    this.titleEndIndent = 10,
    this.titleTrailing,
    this.subData = "",
    this.subStyle,
    this.subTitleEndIndent = 20,
    this.trailing,
    this.trailingEndIndent = 20,
    this.dividerConfig,
    this.height = 44,
    this.color = Colors.white,
    this.borderRadius,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LRListTitleState();
  }
}

class _LRListTitleState extends State<LRListTitle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: widget.borderRadius,
        ),
        child: Column(
          children: [
            Container(
              height: height(),
              child: Row(
                children: [
                  leading(),

                  // 标题
                  title(),
                  // 标题右侧widget
                  titleTrailing(),

                  // 子标题
                  subTitle(),

                  trailing()
                ],
              ),
            ),

            // 分割线
            divider()
          ],
        ),
      ),
    );
  }

  /// 处理高度
  double height() {
    return widget.dividerConfig == null ? widget.height - 0.01 : widget.height - widget.dividerConfig.height;
  }

  /// 处理 leading
  Widget leading() {
    if (widget.leading != null) {
      return Row(
        children: [
          SizedBox(width: widget.leadingIndent),
          widget.leading,
          SizedBox(width: widget.titleIndent)
        ],
      );
    } else {
      return SizedBox(width: widget.titleIndent);
    }
  }

  /// 处理标题
  Widget title() {
    return Row(
      children: [
        Text(
          widget.data,
          style: widget.style,
        ),
        SizedBox(width: widget.titleEndIndent),
      ],
    );
  }

  /// 处理标题右侧 widget
  Widget titleTrailing() {
    if (widget.titleTrailing != null) {
      return widget.titleTrailing;
    } else {
      return Text("");
    }
  }

  /// 处理子标题
  Widget subTitle() {
    return Expanded(
        child: Container(
          alignment: Alignment.centerRight,
          child: Text(
            widget.subData,
            style: widget.subStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
    );
  }

  /// 处理 trailing
  Widget trailing() {
    if (widget.trailing != null) {
      return Row(
        children: [
          SizedBox(width: widget.subTitleEndIndent),
          widget.trailing,
          SizedBox(width: widget.trailingEndIndent),
        ],
      );
    } else {
      return SizedBox(width: widget.subTitleEndIndent);
    }
  }

  /// 处理分割线
  Widget divider() {
    if (widget.dividerConfig != null) {
      return Divider(
        color: widget.dividerConfig.color,
        thickness: widget.dividerConfig.height,
        height: widget.dividerConfig.height,
        indent: widget.dividerConfig.indent,
        endIndent: widget.dividerConfig.endIndent,
      );
    } else {
      return Divider(height: 0.01, color: Colors.transparent,);
    }
  }

}
