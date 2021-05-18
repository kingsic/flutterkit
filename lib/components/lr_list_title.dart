import 'package:flutter/material.dart';

typedef LRListTitleTapCallback = void Function();
typedef LRListTitleLongPressCallback = void Function();

class LRListTitle extends StatelessWidget {
  /// 标题左侧的 Widget
  final Widget leading;

  /// 标题左侧的 Widget 距左边间距，默认为：20
  final double leadingIndent;

  /// 标题左侧的 Widget 距右边间距，默认为：10
  final double leadingEndIndent;

  /// 标题文本
  final String data;

  /// 标题文本样式
  final TextStyle style;

  /// 标题距左边间距，默认为：20
  final double titleIndent;

  /// 标题距右边间距，默认为：10
  final double titleEndIndent;

  /// 标题右侧的 Widget
  final Widget trailing;

  /// 子标题文本
  final String subData;

  /// 子标题文本样式
  final TextStyle subStyle;

  /// 子标题距右边间距，默认为：20
  final double subTitleIndent;

  /// 子标题右侧的 Widget
  final Widget subTrailing;

  /// 子标题左侧的 Widget 距左边间距，默认为：10
  final double subTrailingIndent;

  /// 子标题右侧的 Widget 距右边间距，默认为：20
  final double subTrailingEndIndent;

  /// 分割线颜色，默认为：Color(0xFFA8A8A8)
  final Color dividerColor;

  /// 分割线高度，默认为：0.37
  final double dividerHeight;

  /// 分割线距左边间距，默认为：20
  final double dividerIndent;

  /// 分割线距右边边距，默认为：20
  final double dividerEndIndent;

  /// LRListTitle 高度，默认为：44
  final double height;

  /// 点击回调函数
  final LRListTitleTapCallback onTap;

  /// 长按回调函数
  final LRListTitleLongPressCallback onLongPress;

  const LRListTitle(
    this.data, {
    Key key,
    this.leading,
    this.leadingIndent = 20,
    this.leadingEndIndent = 10,
    this.style,
    this.titleIndent = 20,
    this.titleEndIndent = 10,
    this.trailing,
    this.subData = "",
    this.subStyle,
    this.subTitleIndent = 20,
    this.subTrailing,
    this.subTrailingIndent = 10,
    this.subTrailingEndIndent = 20,
    this.dividerColor = const Color(0xFFA8A8A8),
    this.dividerHeight = 0.37,
    this.dividerIndent = 20,
    this.dividerEndIndent = 20,
    this.height = 44,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        child: Column(
          children: [
            Container(
              height: height - dividerHeight,
              child: Row(
                children: [
                  SizedBox(width: leading == null ? 0 : leadingIndent),
                  leading == null ? Text("") : leading,
                  SizedBox(
                      width: leading == null ? titleIndent : leadingEndIndent),
                  Text(
                    data,
                    style: style,
                  ),
                  SizedBox(width: titleEndIndent),
                  trailing == null ? Text("") : trailing,
                  Expanded(child: Text("")),
                  Text(
                    subData,
                    style: subStyle,
                  ),
                  SizedBox(width: subTrailing == null ? subTitleIndent : 0),
                  SizedBox(width: subTrailing == null ? 0 : subTrailingIndent),
                  subTrailing == null ? Text("") : subTrailing,
                  SizedBox(
                      width: subTrailing == null ? 0 : subTrailingEndIndent)
                ],
              ),
            ),
            Divider(
              color: dividerColor,
              thickness: dividerHeight,
              height: dividerHeight,
              indent: dividerIndent,
              endIndent: dividerEndIndent,
            ),
          ],
        ),
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
