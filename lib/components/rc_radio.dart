import 'package:flutter/material.dart';

/// Radio布局样式
enum RadioStyle {
  /// Row方式布局
  row,

  /// column方式布局
  column,
}

/// Radio与Text之间的布局样式
enum RadioTextStyle {
  /// 仅显示Radio
  none,

  /// Radio在前，文本在后
  previous,

  /// Radio在后，文本在前
  following
}

typedef RCRadioChangedCallback = Function(int);

/// Row 或 Column 包裹的 Radio
class RCRadio extends StatefulWidget {
  /// 数据
  final List data;

  /// Radio 布局样式，默认为：row
  final RadioStyle style;

  /// Radio 与文本之间的布局样式，默认为：none
  final RadioTextStyle radioTextStyle;

  /// 选择时的颜色，默认为：Colors.green
  final Color activeColor;

  /// 填充颜色
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
  final RCRadioChangedCallback onChanged;

  /// RCRadio 的高度
  final double height;

  RCRadio(
    this.data, {
    this.style = RadioStyle.row,
    this.radioTextStyle = RadioTextStyle.none,
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
    return _RCRadioState();
  }
}

class _RCRadioState extends State<RCRadio> {
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
        child: radioStyle()
    );
  }

  Widget radioStyle() {
    if (widget.style == RadioStyle.column) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.data.length, (index) {
            return radioTextStyle(index);
          })
      );
    } else {
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.data.length, (index) {
            return radioTextStyle(index);
          })
      );
    }
  }

  Widget radioTextStyle(int index) {
    return Row(
        children:[
          if(index != 0)
            SizedBox(width: widget.spacing),

          if (widget.radioTextStyle == RadioTextStyle.following)
            Text("${widget.data[index]}", style: widget.textStyle,),

          Radio(
            visualDensity: widget.visualDensity,
            value: index,
            groupValue: groupValue,
            activeColor: widget.activeColor,
            fillColor: MaterialStateProperty.all(widget.fillColor),
            onChanged: (v) {
              setState(() {
                groupValue = v;
              });
              if(widget.onChanged != null) {
                widget.onChanged(v);
              }
            },
          ),

          if (widget.radioTextStyle == RadioTextStyle.previous)
            Text("${widget.data[index]}", style: widget.textStyle),
        ]
    );
  }
}