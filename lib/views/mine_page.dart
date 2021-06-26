import 'package:flutter/material.dart';
import 'package:flutterkit/components/action_sheet.dart';
import 'package:flutterkit/components/alert.dart';
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
                          trailing: Icon(Icons.navigate_next),
                          subStyle: TextStyle(
                            color: Color(0xff666666),
                          ),
                          subTitleEndIndent: 0,
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
                  ActionSheet.show(
                    context: context,
                    config: ActionSheetConfig(
                      data: ["退出登录"],
                      onTap: (index) {
                        showDialog(context: context, builder: (context){
                          return Alert(
                            title: "温馨提示",
                            titleConfig: TitleConfig(
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              )
                            ),
                            message: "再次确认你要退出登录吗",
                            cancelConfig: CancelConfig(
                              style: TextStyle(
                                fontSize: 17,
                              )
                            ),
                            confirmConfig: ConfirmConfig(
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red
                              )
                            ),
                          );
                        });
                      },
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
