import 'package:flutter/material.dart';

typedef CancelCallback = Function();
typedef SureCallback = Function();

class CustomAlertDialog extends Dialog {
  /// 标题
  final String title;

  /// 标题文字样式
  final TextStyle titleStyle;

  /// 内容信息
  final String message;

  /// 内容信息文字样式
  final TextStyle messageStyle;

  /// 取消按钮文字，默认文字为：取消
  final String cancel;

  /// 取消按钮文字样式
  final TextStyle cancelStyle;

  /// 确定按钮文字，默认文字为：确定
  final String sure;

  /// 确定按钮文字样式
  final TextStyle sureStyle;

  /// 控件间的间距
  final double spacing;

  /// 取消按钮的点击回调方法
  final CancelCallback cancelTap;

  /// 确定按钮的点击回调方法
  final CancelCallback sureTap;

  CustomAlertDialog({
    this.title,
    this.titleStyle,
    this.message,
    this.messageStyle,
    this.cancel = "取消",
    this.cancelStyle,
    this.sure = "确定",
    this.sureStyle,
    this.spacing = 20,
    this.cancelTap,
    this.sureTap,
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _lrSpacing = _screenWidth * 0.16;
    double _lineWidth = 0.5;

    return Padding(
      padding: EdgeInsets.only(
        left: _lrSpacing,
        right: _lrSpacing,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: Color(0xfff2f2f2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(
                    top: spacing,
                    left: spacing,
                    right: spacing,
                  ),
                  child: Center(
                    child: Text("$title", style: titleStyle),
                  ),
                ),
                Container(
                  // color: Colors.yellow,
                  constraints: BoxConstraints(minHeight: 50),
                  child: Padding(
                    padding: EdgeInsets.all(spacing),
                    child: IntrinsicHeight(
                      child: Text("$message", style: messageStyle),
                    ),
                  ),
                ),
                Divider(
                  height: _lineWidth,
                  thickness: _lineWidth,
                  color: Colors.black38,
                ),
                Container(
                    height: 44,
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width:
                                    (double.infinity - 2 * _lrSpacing - 0.5) *
                                        0.5,
                                child: Text(
                                  "$cancel",
                                  style: cancelStyle,
                                ),
                                color: Colors.transparent,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                if (sureTap != null) {
                                  cancelTap();
                                }
                              }),
                        ),
                        // ),
                        Container(
                          width: _lineWidth,
                          color: Colors.black38,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: (double.infinity - 2 * _lrSpacing - 0.5) *
                                  0.5,
                              child: Text(
                                "$sure",
                                style: sureStyle,
                              ),
                              color: Colors.transparent,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              if (sureTap != null) {
                                sureTap();
                              }
                            },
                          ),
                        ),
                      ],
                    ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
