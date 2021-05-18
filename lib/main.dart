import 'package:flutter/material.dart';
import 'package:flutterkit/config/app_theme.dart';
import 'package:flutterkit/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Kit',
      theme: themeData,
      home: RootPage(),
    );
  }
}
