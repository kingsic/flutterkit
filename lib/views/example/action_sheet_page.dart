import 'package:flutter/material.dart';
import 'package:flutterkit/components/action_sheet.dart';
import 'package:flutterkit/components/tags.dart';

class ActionSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("action_sheet"),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Tags(["action_sheet"],
                crossAxisCount: 1,
                backgroundColor: Colors.black12,
                selectedBackgroundColor: Colors.green,
                selectedStyle: TextStyle(
                    color: Colors.white
                ),
                borderRadius: BorderRadius.circular(10),
                onTap: (index) {
                  ActionSheet.show(
                      context: context,
                      config: ActionSheetConfig(
                          data: ["退出登录"],
                          onTap: (index) {

                          },
                          style: TextStyle(color: Colors.red),
                          message: "退出后不会删除任何历史数据，下次登录依然可以使用本账号"
                      )
                  );
                },
              ),
            );
          }
      ),
    );
  }
}