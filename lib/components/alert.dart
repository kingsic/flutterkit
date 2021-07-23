import 'package:flutter/material.dart';

class TitleConfig {
  /// 文本样式，默认为：const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)
  final TextStyle style;

  /// 文本排列，默认为：TextAlign.start
  final TextAlign textAlign;

  /// padding，默认为：EdgeInsets.fromLTRB(15, 20, 15, 0)
  final EdgeInsetsGeometry padding;

  const TitleConfig({
    this.style = const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
    this.textAlign,
    this.padding = const EdgeInsets.fromLTRB(15, 20, 15, 0)
  });
}

class MessageConfig {
  /// 信息文本样式，默认为：const TextStyle(fontSize: 13, color: Colors.black)
  final TextStyle style;

  /// 信息文本排列，默认为：TextAlign.start
  final TextAlign textAlign;

  /// padding，默认为：EdgeInsets.fromLTRB(15, 10, 15, 20)
  final EdgeInsetsGeometry padding;

  const MessageConfig({
    this.style = const TextStyle(fontSize: 13, color: Colors.black),
    this.textAlign,
    this.padding = const EdgeInsets.fromLTRB(15, 10, 15, 20)
  });
}

class CancelConfig {
  /// 文本数据，默认为："取消"
  final String data;

  /// 文本样式，默认为：const TextStyle(fontSize: 16, color: Colors.black),
  final TextStyle style;

  /// 点击回调方法
  final VoidCallback onTap;

  /// 自定义 cancel
  final Widget cancel;

  const CancelConfig({
    this.data = "取消",
    this.style = const TextStyle(fontSize: 16, color: Colors.black),
    this.onTap,
    this.cancel,
  });
}

class ConfirmConfig {
  /// 文本数据，默认为："确定"
  final String data;

  /// 文本样式，默认为：const TextStyle(fontSize: 16, color: Colors.black)
  final TextStyle style;

  /// 点击回调方法
  final VoidCallback onTap;

  /// 自定义 confirm
  final Widget confirm;

  const ConfirmConfig({
    this.data = "确定",
    this.style = const TextStyle(fontSize: 16, color: Colors.black),
    this.onTap,
    this.confirm
  });
}

class Alert extends StatefulWidget {
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

  /// 按钮高度，默认为：45.0
  final double buttonHeight;

  /// 颜色
  final Color color;

  /// 圆角大小，默认为：10.0
  final double radius;

  /// 分割线颜色，默认为：Color(0xffeeeeee)
  final Color dividerColor;

  const Alert({
    Key key,
    this.title,
    this.titleConfig= const TitleConfig(),
    this.message = "",
    this.messageConfig = const MessageConfig(),
    this.content,
    this.cancelConfig,
    this.confirmConfig,
    this.buttonHeight = 45,
    this.color = Colors.white,
    this.radius = 10.0,
    this.dividerColor = const Color(0xffeeeeee),
  });

  @override
  State<StatefulWidget> createState() {
    return _AlertState();
  }
}
class _AlertState extends State<Alert> {
  bool _cancelClick = false;
  bool _confirmClick = false;

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
              color: widget.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.radius),
                ),
              ),
            ),
            child: Column(
              children: [
                // 标题内容
                if (widget.title != null)
                  titleContent(),

                // content
                if (widget.content != null)
                  widget.content,
                if (widget.content == null)
                  messageContent(),

                // 按钮
                if (widget.cancelConfig != null || widget.confirmConfig != null)
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
      padding: widget.titleConfig.padding,
      child: Text(widget.title,
        style: widget.titleConfig.style,
        textAlign: widget.titleConfig.textAlign,
      ),
    );
  }

  /// 信息
  Widget messageContent() {
    return Container(
      color:  Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      padding: widget.messageConfig.padding,
      child: Text(widget.message,
        style: widget.messageConfig.style,
        textAlign: widget.messageConfig.textAlign,
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
            color: widget.dividerColor,
            width: double.infinity,
            height: 1,
          ),

          Container(
            width: double.infinity,
            color: Colors.transparent,
            height: widget.buttonHeight,
            child: Row(
              children: [
                if (widget.cancelConfig != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (widget.cancelConfig.cancel == null) {
                          Navigator.pop(context);
                          if (widget.cancelConfig.onTap != null) {
                            widget.cancelConfig.onTap();
                          }
                        }
                      },
                      onTapDown: (details) {
                        if (widget.cancelConfig.cancel == null) {
                          setState(() {
                            _cancelClick = true;
                          });
                        }
                      },
                      onTapCancel: () {
                        if (widget.cancelConfig.cancel == null) {
                          setState(() {
                            _cancelClick = false;
                          });
                        }
                      },
                      child: Container(
                        color: _cancelClick == true ? Colors.black12.withOpacity(0.07) : Colors.transparent,
                        alignment: Alignment.center,
                        height: widget.buttonHeight,
                        child: widget.cancelConfig.cancel != null ? widget.cancelConfig.cancel : Text(widget.cancelConfig.data, style: widget.cancelConfig.style,),
                      ),
                    ),
                  ),

                if (widget.cancelConfig != null && widget.confirmConfig !=null)
                  Container(
                    color: widget.dividerColor,
                    width: 1,
                    height: widget.buttonHeight,
                  ),

                if (widget.confirmConfig != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (widget.confirmConfig.confirm == null) {
                          Navigator.pop(context);
                          if (widget.confirmConfig.onTap != null) {
                            widget.confirmConfig.onTap();
                          }
                        }
                      },
                      onTapDown: (details) {
                        if (widget.confirmConfig.confirm == null) {
                          setState(() {
                            _confirmClick = true;
                          });
                        }
                      },
                      onTapCancel: () {
                        if (widget.confirmConfig.confirm == null) {
                          setState(() {
                            _confirmClick = false;
                          });
                        }
                      },
                      child: Container(
                        color: _confirmClick == true ? Colors.black12.withOpacity(0.07) : Colors.transparent,
                        alignment: Alignment.center,
                        height: widget.buttonHeight,
                        child: widget.confirmConfig.confirm != null ? widget.confirmConfig.confirm : Text(widget.confirmConfig.data, style: widget.confirmConfig.style,),
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
