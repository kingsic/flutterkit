import 'package:flutter/material.dart';
import 'package:flutterkit/components/password_input_box.dart';

class PaymentPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: PasswordInputBox(
          boxBorderRaiuds: 7,
          focusNode: true,
          resultCallback: (value) {
            print("value: $value");
          },
        ),
      ),
    );
    //PasswordInputBox();
  }
}
