import 'package:flutter/material.dart';
import 'package:flutterkit/components/rc_radio.dart';

class RCRadioPage extends StatelessWidget {
  List dataList = ["水平方向", "垂直方向"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rc_radio"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            RCRadio(["数学", "语文", "历史"],
              radioTextStyle: RadioTextStyle.previous,
            ),

            RCRadio(["数学", "语文", "历史"],
              radioTextStyle: RadioTextStyle.following,
              spacing: 20,
              initialIndex: 1,
            ),

            RCRadio(["数学", "语文", "历史"],
              style: RadioStyle.column,
              radioTextStyle: RadioTextStyle.previous,
            ),
          ],
        ),
      ),
    );
  }
}