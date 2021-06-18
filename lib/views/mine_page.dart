import 'package:flutter/material.dart';
import 'package:flutterkit/components/bottom_action_sheet.dart';
import 'package:flutterkit/components/button.dart';
import 'package:flutterkit/components/lr_list_title.dart';
import 'package:flutterkit/views/payment_password.dart';

class MinePage extends StatelessWidget {
  List lists = ["支付密码", "设置"];
  List subLists = ["passwordInputBox", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我的"),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        child: LRListTitle(
                          lists[index],
                          subData: subLists[index],
                          subTrailing: Icon(Icons.navigate_next),
                          subStyle: TextStyle(
                            color: Color(0xff666666),
                          ),
                          subTrailingIndent: 0,
                          onTap: () {
                            if (index == 0) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return PaymentPassword();
                              }));
                            }
                          },
                        ),
                      );
                    })),
            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 30,
              ),
              child: Button(
                child: Text("退出登录"),
                config: ButtonStyleConfig(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  size: Size(
                    double.infinity,
                    50
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  BottomActionSheet.show(
                    context: context,
                    config: ActionSheetConfig(
                      data: ["退出登录"],
                      style: TextStyle(color: Colors.red),
                      message: "退出后不会删除任何历史数据，下次登录依然可以使用本账号"
                    )
                  );
                },
              ),
            )
          ],
        ));
  }
}
