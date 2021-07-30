import 'package:flutter/material.dart';
import 'package:flutterkit/components/dotted_line.dart';

class DottedLinePage extends StatelessWidget {
  List dataList = ["水平方向", "垂直方向"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dotted_line"),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 200,
                  color: Colors.lightGreen,
                  child: DottedLine(axis: Axis.horizontal, color: Colors.red, width: 7,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 200,
                  color: Colors.lightGreen,
                  child: DottedLine(axis: Axis.vertical, color: Colors.red, height: 7,),
                )
              ],
            );
          }
      ),
    );
  }
}