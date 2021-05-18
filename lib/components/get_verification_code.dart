import 'dart:async';
import 'package:flutter/material.dart';

typedef GetVerificationCodeTapCallback = Function();

class GetVerificationCode extends StatefulWidget {
  /// 初始按钮文字，默认为：获取验证码
  final String data;

  /// 倒计时结束后的按钮文字，默认为：重新验证码
  final String endData;

  /// 文字大小，默认为：12
  final double fontSize;

  /// 文字字号重，默认为：FontWeight.w600
  final FontWeight fontWeight;

  /// 普通状态下文字颜色，默认为：Colors.white
  final Color textColor;

  /// 不能点击状态下文字颜色，默认为：Colors.green
  final Color disabledTextColor;

  /// 普通状态下按钮背景颜色，默认为：Colors.green
  final Color backgroundColor;

  /// 不能点击状态下按钮背景颜色，默认为：Colors.black12
  final Color disabledBackgroundColor;

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
    this.fontSize = 12,
    this.fontWeight = FontWeight.w600,
    this.textColor = Colors.white,
    this.disabledTextColor = Colors.green,
    this.backgroundColor = Colors.green,
    this.disabledBackgroundColor = Colors.black12,
    this.count = 60,
    this.previousText = "",
    this.followingText = "",
    this.width,
    this.height,
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
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isEnable
                ? widget.backgroundColor
                : widget.disabledBackgroundColor,
            borderRadius: widget.borderRadius,
            border: Border.all(
                width: widget.borderWidth, color: widget.borderColor),
          ),
          child: AbsorbPointer(
            absorbing: !isEnable,
            child: Text(
              "${_tempBtnText ?? widget.data}",
              style: TextStyle(
                fontSize: widget.fontSize,
                color: isEnable ? widget.textColor : widget.disabledTextColor,
                fontWeight: widget.fontWeight,
              ),
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
