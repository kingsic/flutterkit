import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  /// 当前评分
  final double rating;

  /// 最高评分，默认为：10
  final double maxRating;

  /// 未选中的图片，默认为：星星
  final Widget unselectedImage;

  /// 选中的图片，默认为：星星
  final Widget selectedImage;

  /// 个数，默认为：5
  final int count;

  /// 大小，默认为：30
  final double size;

  /// 默认 icon 时，未选中图标的颜色，默认为：Colors.grey
  final Color unselectedColor;

  /// 默认 icon 时，选中图标的颜色，默认为：Colors.red
  final Color selectedColor;

  StarRating(
    this.rating, {
    Key key,
    this.maxRating = 10,
    Widget unselectedImage,
    Widget selectedImage,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = Colors.grey,
    this.selectedColor = Colors.red,
  })  : unselectedImage = unselectedImage ??
            Icon(
              Icons.star,
              size: size,
              color: unselectedColor,
            ),
        selectedImage =
            selectedImage ?? Icon(Icons.star, size: size, color: selectedColor);

  @override
  State<StatefulWidget> createState() {
    return _StarRatingState();
  }
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getUnselectedStar(),
        getSelectedStar(),
      ],
    );
  }

  /// 获取未选中的图标
  Widget getUnselectedStar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (index) {
        return widget.unselectedImage;
      }),
    );
  }

  /// 获取选中的图标
  Widget getSelectedStar() {
    /// 1、计算完整的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();

    /// 2、剩余的一个star显示的比例
    double leftValue = widget.rating - entireCount * oneValue;
    double ratioLeft = leftValue / oneValue;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entireCount + 1, (index) {
        if (index < entireCount) return widget.selectedImage;
        return ClipRect(
          clipper: _ClipRectClipRect(width: widget.size * ratioLeft),
          child: widget.selectedImage,
        );
      }),
    );
  }
}

class _ClipRectClipRect extends CustomClipper<Rect> {
  final double width;
  _ClipRectClipRect({this.width});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(covariant _ClipRectClipRect oldClipper) {
    return width != oldClipper.width;
  }
}
