import 'dart:ui';
import 'package:flutter/material.dart';

typedef BottomSheetCallback = Function(int);

class BottomSheetConfig {
  /// 提示信息
  final String message;

  /// 提示信息的 TextStyle
  final TextStyle messageStyle;

  /// 其他标题数据
  final List data;

  /// 其他标题的 TextStyle
  final TextStyle style;

  /// 取消标题的 TextStyle
  final TextStyle cancelStyle;

  /// 分割线高度，默认为：0.5
  final double dividerHeight;

  /// 分割线颜色，默认为：Colors.black12
  final Color dividerColor;

  /// 其他标题的点击回调方法
  final BottomSheetCallback onTap;

  BottomSheetConfig({
    this.message = "",
    this.messageStyle,
    this.data,
    this.style,
    this.cancelStyle,
    this.dividerHeight = 0.5,
    this.dividerColor = Colors.black12,
    this.onTap
  }): assert(
    data != null,
  );
}

class BottomSheet {
  /// 显示 BottomSheet
  static show({BuildContext context, BottomSheetConfig config}) {
    showModalBottomSheet(context: context, backgroundColor: Colors.white, builder: (content) {
      return SafeArea(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Offstage(
                  offstage: config.message == "" ? true : false,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20
                    ),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(config.message,
                          textAlign: TextAlign.center,
                          style: config.messageStyle,
                        ),
                        SizedBox(height: 20),
                        Divider(
                          height: config.dividerHeight,
                          thickness: config.dividerHeight,
                          color: config.dividerColor,
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: List.generate(config.data.length, (index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(config.data[index],
                            textAlign: TextAlign.center,
                            style: config.style,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            if (config.onTap != null) {
                              config.onTap(index);
                            }
                          },
                        ),
                        if (index != config.data.length - 1)
                          Divider(
                            height: config.dividerHeight,
                            thickness: config.dividerHeight,
                            color: config.dividerColor,
                          )
                      ],
                    );
                  }),
                ),

                Divider(
                  height: 7,
                  thickness: 7,
                  color: Colors.grey.withOpacity(0.17),
                ),
                ListTile(
                  title: Text("取消",
                    textAlign: TextAlign.center,
                    style: config.cancelStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
      );
    });
  }
}