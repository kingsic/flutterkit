import 'package:flutter/material.dart';
import 'package:flutterkit/components/flexible_text.dart';

class FlexibleTextPage extends StatelessWidget {
  List dataList = ["样式一", "样式二", "样式三"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flexible_text"),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("样式一"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: FlexibleText("曾经沧海难为水，除却巫山不是云",
                    config: TextConfig(
                        style: TextStyle(
                            color: Colors.black
                        )
                    ),
                    alignment: Alignment.centerLeft,
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("样式二"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: FlexibleText("曾经沧海难为水，除却巫山不是云。取次花丛懒回顾，半缘修道半缘君",
                    fit: FlexFit.tight,
                    config: TextConfig(
                        style: TextStyle(
                            color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis
                    ),
                    alignment: Alignment.centerLeft,
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("样式三"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: FlexibleText("提交",
                    config: TextConfig(
                        style: TextStyle(
                            color: Colors.white
                        ),
                        indent: 10
                    ),
                    color: Colors.green,
                    height: 50,
                    borderRadius: BorderRadius.circular(25),
                    leading: Image.asset("assets/images/tabbar/student_active.png", width: 22, color: Colors.white,),
                    // trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}