import 'package:flutter/material.dart';

enum RadioStyle {
  /// 只有 Radio
  none,

  /// Radio 在前，文字在后
  previous,

  /// Radio 在后，文字在前
  following
}

typedef RowRadioChangedCallback = Function(int);

class RowRadio extends StatefulWidget {
  /// 数据源
  final List data;

  /// Radio 样式，默认为：none
  final RadioStyle style;

  /// 选择时的颜色，默认为：Colors.green
  final Color activeColor;

  /// 填充颜色，默认为 null。有值时，activeColor 将不起作用
  final Color fillColor;

  /// 初始时选中的 Radio 下标
  final int initialIndex;

  /// Radio 之间的间距，默认为：0
  final double spacing;

  /// [horizontal]和[vertical]必须在[minimumDensity]和[maximumDensity]之间
  final VisualDensity visualDensity;

  /// 文本样式
  final TextStyle textStyle;

  /// Radio 改变后的回调函数
  final RowRadioChangedCallback onChanged;

  /// RowRadio 的高度
  final double height;

  RowRadio(
    this.data, {
    Key key,
    this.style = RadioStyle.none,
    this.activeColor = Colors.green,
    this.fillColor,
    this.initialIndex = 0,
    this.spacing = 0,
    this.visualDensity,
    this.textStyle,
    this.onChanged,
    this.height,
  });

  @override
  State<StatefulWidget> createState() {
    return _RowRadioState();
  }
}

class _RowRadioState extends State<RowRadio> {
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    groupValue = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.data.length, (index) {
              return Row(children: [
                if (index != 0) SizedBox(width: widget.spacing),
                if (widget.style == RadioStyle.following)
                  Text(
                    "${widget.data[index]}",
                    style: widget.textStyle,
                  ),
                Radio(
                  visualDensity: widget.visualDensity,
                  value: index,
                  groupValue: groupValue,
                  activeColor: widget.activeColor,
                  fillColor: MaterialStateProperty.all(widget.fillColor),
                  focusColor: Colors.yellow,
                  hoverColor: Color(0xFF6DD2F3),
                  onChanged: (v) {
                    setState(() {
                      groupValue = v;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged(v);
                    }
                  },
                ),
                if (widget.style == RadioStyle.previous)
                  Text("${widget.data[index]}", style: widget.textStyle),
              ]);
            })
        )
    );
  }
}
