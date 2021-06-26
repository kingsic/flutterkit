import 'package:flutter/material.dart';

class TitleConfig {
  /// 文本样式
  final TextStyle style;

  /// 文本排列，默认为：TextAlign.start
  final TextAlign textAlign;

  /// padding，默认为：EdgeInsets.fromLTRB(15, 20, 15, 0)
  final EdgeInsetsGeometry padding;

  const TitleConfig({
    this.style,
    this.textAlign,
    this.padding = const EdgeInsets.fromLTRB(15, 20, 15, 0)
  });
}

class MessageConfig {
  /// 信息文本样式
  final TextStyle style;

  /// 信息文本排列，默认为：TextAlign.start
  final TextAlign textAlign;

  /// padding，默认为：EdgeInsets.fromLTRB(15, 10, 15, 20)
  final EdgeInsetsGeometry padding;

  const MessageConfig({
    this.style,
    this.textAlign,
    this.padding = const EdgeInsets.fromLTRB(15, 10, 15, 20)
  });
}

class CancelConfig {
  /// 文本，默认为："取消"
  final String data;

  /// 文本样式
  final TextStyle style;

  /// 点击回调方法
  final VoidCallback onTap;

  /// 自定义 cancel
  final Widget cancel;

  const CancelConfig({
    this.data = "取消",
    this.style,
    this.onTap,
    this.cancel,
  });
}

class ConfirmConfig {
  /// 文本，默认为："确定"
  final String data;

  /// 文本样式
  final TextStyle style;

  /// 点击回调方法
  final VoidCallback onTap;

  /// 自定义 confirm
  final Widget confirm;

  const ConfirmConfig({
    this.data = "确定",
    this.style,
    this.onTap,
    this.confirm
  });
}

class Alert extends StatelessWidget {
  /// 标题
  final String title;

  /// 标题配置类
  final TitleConfig titleConfig;

  /// 信息
  final String message;

  /// 信息配置类
  final MessageConfig messageConfig;

  /// 内容
  final Widget content;

  /// 取消按钮配置类
  final CancelConfig cancelConfig;

  /// 确定按钮配置类
  final ConfirmConfig confirmConfig;

  /// 颜色
  final Color color;

  /// 圆角大小，默认为：10.0
  final double circular;

  /// 分割线颜色，默认为：Color(0xffeeeeee)
  final Color dividerColor;

  Alert({
    this.title,
    this.titleConfig= const TitleConfig(),
    this.message = "",
    this.messageConfig = const MessageConfig(),
    this.content,
    this.cancelConfig,
    this.confirmConfig,
    this.color = Colors.white,
    this.circular = 10.0,
    this.dividerColor = const Color(0xffeeeeee),
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _lrSpacing = _screenWidth * 0.16;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _lrSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(circular),
                ),
              ),
            ),
            child: Column(
              children: [
                // 标题内容
                if (title != null)
                  titleContent(),

                // content
                if (content != null)
                  content,
                if (content == null)
                  messageContent(),

                // 按钮
                if (cancelConfig != null || confirmConfig != null)
                  btnContent(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 标题
  Widget titleContent() {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      padding: titleConfig.padding,
      child: Text(title,
        style: titleConfig.style,
        textAlign: titleConfig.textAlign,
      ),
    );
  }

  /// 信息
  Widget messageContent() {
    return Container(
      color:  Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      padding: messageConfig.padding,
      child: Text(message,
        style: messageConfig.style,
        textAlign: messageConfig.textAlign,
      ),
    );
  }

  /// 按钮
  Widget btnContent(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            color: dividerColor,
            width: double.infinity,
            height: 1,
          ),

          Container(
            width: double.infinity,
            color: Colors.transparent,
            height: 45,
            child: Row(
              children: [
                if (cancelConfig != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (cancelConfig.cancel == null) {
                          Navigator.pop(context);
                          if (cancelConfig.onTap != null) {
                            cancelConfig.onTap();
                          }
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        height: 45,
                        child: cancelConfig.cancel != null ? cancelConfig.cancel : Text(cancelConfig.data, style: cancelConfig.style,),
                      ),
                    ),
                  ),

                if (cancelConfig != null && confirmConfig !=null)
                  Container(
                    color: dividerColor,
                    width: 1,
                    height: 45,
                  ),

                if (confirmConfig != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (confirmConfig.confirm == null) {
                          if (confirmConfig.onTap != null) {
                            confirmConfig.onTap();
                          }
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        height: 45,
                        child: confirmConfig.confirm != null ? confirmConfig.confirm : Text(confirmConfig.data, style: confirmConfig.style,),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
