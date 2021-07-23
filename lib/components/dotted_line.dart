import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  /// 虚线的方向
  final Axis axis;

  /// 虚线的宽度，默认为：1.0
  final double width;

  /// 虚线的高度，默认为：1.0
  final double height;

  /// 虚线的个数，默认为：9
  final int count;

  /// 虚线的颜色，默认为：0xffaaaaaa
  final Color color;

  const DottedLine({
    Key key,
    @required this.axis,
    this.width = 1.0,
    this.height = 1.0,
    this.count = 9,
    this.color = const Color(0xffaaaaaa)
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        return Container(
          width: width,
          height: height,
          color: color,
        );
      }),
    );
  }
}
