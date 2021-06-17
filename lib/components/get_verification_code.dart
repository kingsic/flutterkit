import 'dart:async';
import 'package:flutter/material.dart';

typedef GetVerificationCodeTapCallback = Function();

class GetVerificationCode extends StatefulWidget {
  /// 初始按钮文字，默认为：获取验证码
  final String data;

  /// 倒计时结束后的按钮文字，默认为：重新验证码
  final String endData;

  /// 文本样式
  final TextStyle style;

  /// 不能点击状态下的文本样式
  final TextStyle disabledStyle;

  /// 普通状态下按钮的颜色，默认为：Colors.green
  final Color color;

  /// 不能点击状态下按钮的颜色，默认为：Colors.black12
  final Color disabledColor;

  /// 倒计时时间，默认为：60s
  final int count;

  /// 倒计时开始后，count前面的提示文字
  final String previousText;

  /// 倒计时开始后，count后面的提示文字
  final String followingText;

  /// 按钮的宽度
  final double width;

  /// 按钮的高度
  final double height;

  /// 布局样式，默认为：Alignment.center
  final AlignmentGeometry alignment;

  /// 圆角（BorderRadius.circular(_) or BorderRadius.only(topLeft: Radius.circular(_)））
  final BorderRadius borderRadius;

  /// 边框宽度，默认为：0.5
  final double borderWidth;

  /// 边框颜色，默认为：Colors.transparent
  final Color borderColor;

  /// 点击回调函数
  final GetVerificationCodeTapCallback onTap;

  GetVerificationCode({
    Key key,
    this.data = "获取验证码",
    this.endData = "重新验证码",
    this.style,
    this.disabledStyle,
    this.color = Colors.green,
    this.disabledColor = Colors.black12,
    this.count = 60,
    this.previousText = "",
    this.followingText = "",
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.borderWidth = 0.5,
    this.borderColor = Colors.transparent,
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _GetVerificationCodeState();
  }
}

class _GetVerificationCodeState extends State<GetVerificationCode> {
  Timer _timer;
  int _tempCount;
  bool isEnable = true;
  String _tempBtnText;

  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
    _timer = null;
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _tempCount--;
      setState(() {
        if (_tempCount == 0) {
          timer.cancel();
          isEnable = true;
          _tempCount = widget.count;
          _tempBtnText = widget.endData;
        } else {
          isEnable = false;
          _tempBtnText =
              "${widget.previousText}$_tempCount${widget.followingText}";
        }
      });
    });
  }

  void _btnOnPressed() {
    setState(() {
      if (isEnable) {
        isEnable = false;
        _tempCount = widget.count;
        _tempBtnText =
            "${widget.previousText}$_tempCount${widget.followingText}";
        _initTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: widget.width,
          height: widget.height,
          alignment: widget.alignment,
          decoration: BoxDecoration(
            color: isEnable
                ? widget.color
                : widget.disabledColor,
            borderRadius: widget.borderRadius,
            border: Border.all(
                width: widget.borderWidth, color: widget.borderColor),
          ),
          child: AbsorbPointer(
            absorbing: !isEnable,
            child: Text(
              "${_tempBtnText ?? widget.data}",
              style: isEnable ? widget.style : widget.disabledStyle,
            ),
          )),
      onTap: () {
        setState(() {
          _btnOnPressed();
          if (widget.onTap != null) {
            widget.onTap();
          }
        });
      },
    );
  }
}
