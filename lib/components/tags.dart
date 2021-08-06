import 'package:flutter/material.dart';

/// 标签文本选中回调函数，返回选中标签下标值
///
/// 单选情况下，数组元素始终为：1，多选情况下，数组元素为：选中标签下标值
typedef TagsCallback = Function(List);

/// 标签文本前面的配置类
class LeadingConfig {
  /// 内容组件
  final Widget content;

  /// 对应下标值
  final int index;

  /// 与文本之间的间距
  final double spacing;

  /// 根据标签的下标值，给标签文本前面添加配置组件
  LeadingConfig(this.content, this.index, {
    this.spacing
  });
}

/// 标签文本后面的配置类
class TrailingConfig {
  /// 内容组件
  final Widget content;

  /// 对应下标值
  final int index;

  /// 与文本之间的间距
  final double spacing;

  /// 根据标签的下标值，给标签文本后面添加配置组件
  TrailingConfig(this.content, this.index, {
    this.spacing
  });
}

/// 标签类
class Tags extends StatefulWidget {
  /// 标签文本数据
  final List data;

  /// 横轴个数
  final int crossAxisCount;

  /// 文本对齐样式，默认为：Alignment.center。只有设置 crossAxisCount 属性时，才起作用
  final AlignmentGeometry alignment;

  /// FlexFit，默认为：FlexFit.loose。只有设置 crossAxisCount 属性时，才起作用
  final FlexFit fit;

  /// 标签文本样式
  final TextStyle style;

  /// 标签选中时的文本样式
  final TextStyle selectedStyle;

  /// 标签文本前面配置类集合
  final List<LeadingConfig> leadingConfigs;

  /// 标签文本后面配置类集合
  final List<TrailingConfig> trailingConfigs;

  /// 标签内容距左右边距的间距，默认为：15.0
  final double contentSpacing;

  /// 标签高度，默认为：30.0
  final double height;

  /// 标签之间左右的间距，默认为：15.0
  final double spacing;

  /// 标签之间上下的间距，默认为：15.0
  final double runSpacing;

  /// 标签背景颜色，默认为：const Color(0xfff9f9f9)
  final Color backgroundColor;

  /// 标签选中时的背景颜色
  final Color selectedBackgroundColor;

  /// 标签圆角
  final BorderRadius borderRadius;

  /// 标签边框宽度，默认为：1.0
  final double borderWidth;

  /// 标签边框颜色，默认为：Colors.transparent
  final Color borderColor;

  /// 标签选中时的边框颜色，默认为：Colors.transparent
  final Color selectedBorderColor;

  /// 默认选中的标签下标值。单选情况下，如果设置了多个下标值会默认选取第一个下标值
  final List<int> indexes;

  /// 标签是否为多选，默认为：false 单选
  final bool multiSelect;

  /// 标签是否能够选择，默认为：true 可选
  final bool ableSelect;

  /// 标签点击回调方法
  final TagsCallback onTap;

  /// 支持单选（默认）和多选【multiSelect = true】，可选中（默认）和不可选中【ableSelect = false】
  ///
  /// 支持流水布局（默认）和固定布局，设置每行标签个数【crossAxisCount】
  ///
  /// 支持根据标签下标值给标签文本前后添加配置组件【leadingConfigs、trailingConfigs】
  const Tags(
    this.data, {
    Key key,
    this.crossAxisCount = 0,
    this.alignment = Alignment.center,
    this.fit = FlexFit.loose,
    this.style,
    this.selectedStyle,
    this.contentSpacing = 15.0,
    this.leadingConfigs = const [],
    this.trailingConfigs = const [],
    this.height = 30.0,
    this.spacing = 15.0,
    this.runSpacing = 15.0,
    this.backgroundColor = const Color(0xfff9f9f9),
    this.selectedBackgroundColor,
    this.borderRadius,
    this.borderWidth = 1.0,
    this.borderColor = Colors.transparent,
    this.selectedBorderColor = Colors.transparent,
    this.indexes = const [],
    this.multiSelect = false,
    this.ableSelect = true,
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _TagsState();
  }
}

class _TagsState extends State<Tags> {
  List<int> _tempIndexes = [];
  List<LeadingConfig> _tempLeadingConfigModels = [];
  List<int> _tempLeadingConfigIndexes = [];
  List<TrailingConfig> _tempTrailingConfigModels = [];
  List<int> _tempTrailingConfigIndexes = [];

  @override
  void initState() {
    super.initState();

    if (widget.indexes.isNotEmpty) {
      if (widget.multiSelect) {
        _tempIndexes = widget.indexes;
      } else {
        _tempIndexes.add(widget.indexes.first);
      }
    }

    if (widget.leadingConfigs.isNotEmpty) {
      widget.leadingConfigs.forEach((element) {
        LeadingConfig model = element;
        _tempLeadingConfigModels.add(model);
        _tempLeadingConfigIndexes.add(model.index);
      });
    }

    if (widget.trailingConfigs.isNotEmpty) {
      widget.trailingConfigs.forEach((element) {
        TrailingConfig model = element;
        _tempTrailingConfigModels.add(model);
        _tempTrailingConfigIndexes.add(model.index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      children: List.generate(widget.data.length, (index) {
        return GestureDetector(
          onTap: () {
            if (widget.ableSelect) {
              setState(() {});
              if (widget.multiSelect) { // 多选
                if (_tempIndexes.contains(index)) {
                  _tempIndexes.remove(index);
                } else {
                  _tempIndexes.add(index);
                }
              } else { // 单选
                if (_tempIndexes.isNotEmpty) {
                  _tempIndexes.removeAt(0);
                }
                _tempIndexes.add(index);
              }

              if (widget.onTap != null) {
                _tempIndexes.sort((a, b) => a.compareTo(b));
                widget.onTap(_tempIndexes);
              }
            }
          },
          child: widget.crossAxisCount > 0 ? crossAxisCountStyle(index) : defaultStyle(index),
        );
      }),
    );
  }

  Widget crossAxisCountStyle(int index) {
    return LayoutBuilder(
      builder: (context, constrains) {
        double width = constrains.maxWidth;
        double eachTagWidth = (width - (widget.spacing * (widget.crossAxisCount - 1))) / widget.crossAxisCount;
        return Container(
          width: eachTagWidth,
          height: widget.height,
          alignment: widget.alignment,
          decoration: BoxDecoration(
            color: backgroundColor(index),
            borderRadius: widget.borderRadius,
            border: Border.all(color: borderColor(index), width: widget.borderWidth)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_tempLeadingConfigIndexes.contains(index))
                leading(index),

              Flexible(
                fit: widget.fit,
                child: Text(widget.data[index],
                  style: style(index),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ),

              if (_tempTrailingConfigIndexes.contains(index))
                trailing(index)
            ],
          ),
        );
      }
    );
  }

  Widget defaultStyle(int index) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: widget.contentSpacing),
      decoration: BoxDecoration(
        color: backgroundColor(index),
        borderRadius: widget.borderRadius,
        border: Border.all(color: borderColor(index), width: widget.borderWidth)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_tempLeadingConfigIndexes.contains(index))
            leading(index),

          Text(widget.data[index],
            style: style(index),
          ),

          if (_tempTrailingConfigIndexes.contains(index))
            trailing(index)
        ],
      ),
    );
  }

  Widget leading(int index) {
    /// 获取当前 index 所对应的元素处在 _tempLeadingConfigIndexes 数组中的下标值
    int tempIndex = _tempLeadingConfigIndexes.indexOf(index);
    LeadingConfig model = _tempLeadingConfigModels[tempIndex];
    return Row(
      children: [
        model.content,
        SizedBox(width: model.spacing)
      ],
    );
  }

  Widget trailing(int index) {
    int tempIndex = _tempTrailingConfigIndexes.indexOf(index);
    TrailingConfig model = _tempTrailingConfigModels[tempIndex];
    return Row(
      children: [
        SizedBox(width: model.spacing),
        model.content
      ],
    );
  }
  
  /// 文本样式处理
  TextStyle style(int index) {
    if (_tempIndexes.isEmpty) {
      return widget.style;
    } else {
      if (widget.multiSelect) {
        if (_tempIndexes.contains(index)) {
          return widget.selectedStyle;
        } else {
          return widget.style;
        }
      } else {
        return _tempIndexes.first == index ? widget.selectedStyle : widget.style;
      }
    }
  }

  /// 背景颜色处理
  Color backgroundColor(int index) {
    if (_tempIndexes.isEmpty) {
      return widget.backgroundColor;
    } else {
      if (widget.multiSelect) {
        if (_tempIndexes.contains(index)) {
          return widget.selectedBackgroundColor;
        } else {
          return widget.backgroundColor;
        }
      } else {
        return _tempIndexes.first == index ? widget.selectedBackgroundColor : widget.backgroundColor;
      }
    }
  }

  /// 边框颜色处理
  Color borderColor(int index) {
    if (_tempIndexes.isEmpty) {
      return widget.borderColor;
    } else {
      if (widget.multiSelect) {
        if (_tempIndexes.contains(index)) {
          return widget.selectedBorderColor;
        } else {
          return widget.borderColor;
        }
      } else {
        return _tempIndexes.first == index ? widget.selectedBorderColor : widget.borderColor;
      }
    }
  }

}