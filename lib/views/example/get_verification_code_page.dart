import 'package:flutter/material.dart';
import 'package:flutterkit/components/get_verification_code.dart';

class GetVerificationCodePage extends StatelessWidget {
  List dataList = ["水平方向", "垂直方向"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("get_verification_code"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: 100,
              height: 30,
              child: GetVerificationCode(
                color: Colors.lime,
                disabledColor: Colors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 100,
              child: GetVerificationCode(
                color: Colors.black,
                followingText: "秒",
                alignment: Alignment.center,
                style: TextStyle(
                    color: Colors.white
                ),
                disabledColor: Colors.red,
                disabledStyle: TextStyle(
                    color: Colors.white
                ),
              ),
              // color: Colors.lightGreen,
              alignment: Alignment.center,
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 100,
              child: GetVerificationCode(
                color: Colors.black,
                count: 30,
                previousText: "还剩",
                followingText: "秒",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 100,
              child: GetVerificationCode(
                alignment: Alignment.centerLeft,
                color: Colors.black,
                count: 30,
                previousText: "还剩",
                followingText: "秒",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 100,
              child: GetVerificationCode(
                data: "验证码",
                endData: "再次获取",
                alignment: Alignment.centerRight,
                color: Colors.black,
                style: TextStyle(
                    color: Colors.white
                ),
                count: 10,
                previousText: "还剩",
                followingText: "秒",
              ),
            )
          ],
        ),
      ),
    );
  }
}