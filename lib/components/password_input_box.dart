import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef PasswordInputBoxResultCallback = Function(String);

class PasswordInputBox extends StatefulWidget {
  /// 宽度
  final double width;

  /// 高度
  final double height;

  /// 背景颜色
  final Color color;

  /// 提示框数量，默认为：6
  final int number;

  /// 提示框宽度，默认为：47
  final double boxWidth;

  /// 提示框高度，默认为：47
  final double boxHeight;

  /// 提示框颜色，默认为：black12
  final Color boxColor;

  /// 提示框圆角大小，默认为：0.0
  final double boxBorderRaiuds;

  /// 提示框边框的宽度，默认为：0.0
  final double boxBorderWidth;

  /// 提示框边框颜色，默认为：transparent
  final Color boxBorderColor;

  /// 提示框内的圆点大小，默认为：10
  final double boxDotSize;

  /// 输入完成之后的回调函数
  final PasswordInputBoxResultCallback resultCallback;

  /// 输入完成之后是否退出键盘，默认为：false
  final bool focusNode;

  const PasswordInputBox({
    Key key,
    this.number = 6,
    this.width = double.infinity,
    this.height = 100,
    this.color = Colors.transparent,
    this.boxWidth = 47,
    this.boxHeight = 47,
    this.boxColor = Colors.black12,
    this.boxBorderRaiuds = 0,
    this.boxBorderWidth = 0,
    this.boxBorderColor = Colors.transparent,
    this.boxDotSize = 10,
    this.resultCallback,
    this.focusNode = false,
  }) : super();

  @override
  State<StatefulWidget> createState() {
    return _PasswordInputBoxState();
  }
}

class _PasswordInputBoxState extends State<PasswordInputBox> {
  String _textFieldText = "";

  TextEditingController _controller = TextEditingController();
  FocusNode _tempFocusNode = FocusNode();
  FocusScopeNode _tempFocusScope;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _tempFocusNode.unfocus();
    if (_tempFocusScope != null) {
      _tempFocusScope.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.color,
      child: Column(
        children: [
          Container(
            width: widget.width,
            height: widget.height - 0.01,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(widget.number, (index) {
                return _Box(
                  width: widget.boxWidth,
                  height: widget.boxHeight,
                  color: widget.boxColor,
                  radius: widget.boxBorderRaiuds,
                  borderWidth: widget.boxBorderWidth,
                  borderColor: widget.boxBorderColor,
                  textFieldLength: _textFieldText.length,
                  index: index,
                  dotSize: widget.boxDotSize,
                  onTap: () {
                    if (_tempFocusScope == null) {
                      _tempFocusScope = FocusScope.of(context);
                    }
                    _tempFocusScope.requestFocus(_tempFocusNode);
                  },
                );
              }),
            ),
          ),
          Container(
            width: widget.width,
            height: 0.01,
            // color: Colors.yellow,
            child: TextField(
              focusNode: _tempFocusNode,
              controller: _controller,
              cursorWidth: 0.01,
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              autofocus: true,
              style: TextStyle(color: Colors.transparent),
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.number),
                FilteringTextInputFormatter.allow(
                    RegExp("[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]")),
              ],
              onChanged: (value) {
                String tempString = value;
                if (tempString.length >= widget.number) {
                  tempString = tempString.substring(0, widget.number);
                  _textFieldText = value;
                  widget.resultCallback(value);

                  widget.focusNode
                      ? _tempFocusNode.unfocus()
                      : _tempFocusNode.hasFocus;
                } else {
                  _textFieldText = value;
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

/// 输入完成后的回调函数
typedef BoxTapCallback = Function();

/// 单个输入框抽取
class _Box extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final int textFieldLength;
  final int index;
  final double dotSize;
  final BoxTapCallback onTap;

  _Box({
    this.width = 47,
    this.height = 47,
    this.color = Colors.black12,
    this.radius = 0,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.textFieldLength = 0,
    this.index = 0,
    this.dotSize = 10,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor, width: borderWidth)),
        child: Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: textFieldLength > index
                ? Color(0xff272727)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(dotSize * 0.5),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
