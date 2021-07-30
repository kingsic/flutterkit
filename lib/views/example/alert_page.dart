import 'package:flutter/material.dart';
import 'package:flutterkit/components/alert.dart';
import 'package:flutterkit/components/tags.dart';

class AlertPage extends StatelessWidget {
  List dataList = ["默认样式一", "默认样式二", "无标题样式", "自定义提示信息内容"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alert"),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Tags(dataList,
                    backgroundColor: Colors.lightGreen,
                    selectedBackgroundColor: Colors.deepOrange,
                    selectedStyle: TextStyle(
                        color: Colors.white
                    ),
                    borderRadius: BorderRadius.circular(10),
                    onTap: (index) {
                      if (index.first == 0) {
                        showDialog(context: context, builder: (context){
                          return Alert(
                            title: "默认样式一",
                            message: "这是默认样式一的内容信息",
                            // cancelConfig: CancelConfig(),
                            confirmConfig: ConfirmConfig(),
                          );
                        });
                      } else if (index.first == 1) {
                        showDialog(context: context, builder: (context){
                          return Alert(
                            title: "默认样式二",
                            message: "这是默认样式二的内容信息",
                            cancelConfig: CancelConfig(),
                            confirmConfig: ConfirmConfig(),
                          );
                        });
                      } else if (index.first == 2) {
                        showDialog(context: context, builder: (context){
                          return Alert(
                            message: "无标题样式",
                            messageConfig: MessageConfig(
                                padding: EdgeInsets.all(20)
                            ),
                            cancelConfig: CancelConfig(
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                )
                            ),
                            confirmConfig: ConfirmConfig(),
                          );
                        });
                      } else {
                        showDialog(context: context, builder: (context){
                          return Alert(
                            title: "自定义提示信息内容",
                            content: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(text: "曾经沧海难为水，除却巫山不是云\n", style: TextStyle(
                                            color: Colors.red
                                        )),
                                        TextSpan(text: "取次花丛懒回顾，半缘修道半缘君", style: TextStyle(
                                            color: Colors.black
                                        ))
                                      ]
                                  )),
                                ],
                              ),
                            ),
                            cancelConfig: CancelConfig(),
                            confirmConfig: ConfirmConfig(),
                          );
                        });
                      }
                    },
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}