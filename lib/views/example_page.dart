import 'package:flutter/material.dart';
import 'package:flutterkit/components/lr_list_title.dart';
import 'package:flutterkit/tools/app_navigator.dart';
import 'package:flutterkit/views/example/action_sheet_page.dart';
import 'package:flutterkit/views/example/alert_page.dart';
import 'package:flutterkit/views/example/dotted_line_page.dart';
import 'package:flutterkit/views/example/flexible_text_page.dart';
import 'package:flutterkit/views/example/get_verification_code_page.dart';
import 'package:flutterkit/views/example/rc_radio_page.dart';
import 'package:flutterkit/views/example/tags_page.dart';

class ExamplePage extends StatelessWidget {
  List dataList = ["action_sheet", "alert", "dotted_line", "flexible_text", "get_verification_code", "rc_radio", "tags"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("案例"),
        ),
        body: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return LRListTitle(dataList[index],
                style: TextStyle(
                    color: Colors.black
                ),
                dividerConfig: DividerConfig(),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  if (index == 0) {
                    push(context, ActionSheetPage());
                    return;
                  }

                  if (index == 1) {
                    push(context, AlertPage());
                    return;
                  }

                  if (index == 2) {
                    push(context, DottedLinePage());
                    return;
                  }

                  if (index == 3) {
                    push(context, FlexibleTextPage());
                    return;
                  }

                  if (index == 4) {
                    push(context, GetVerificationCodePage());
                    return;
                  }

                  if (index == 5) {
                    push(context, RCRadioPage());
                    return;
                  }

                  push(context, TagsPage());

                },
              );
            }
        )
    );
  }
}
