import 'package:flutter/material.dart';
import 'package:flutterkit/components/dotted_line.dart';
import 'package:flutterkit/components/get_verification_code.dart';
import 'package:flutterkit/components/star_rating.dart';

class ActivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("活动"),
        ),
        body: Center(
          child: Text("活动"),
        )
    );
  }
}
