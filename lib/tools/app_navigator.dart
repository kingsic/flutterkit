import 'package:flutter/material.dart';

/// 跳转到下一路由
push(BuildContext context, Widget routeName) {
  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => routeName,
      )
  );
}

/// 返回到根路由
pushAndRemoveUntil(BuildContext context, Widget routeName) {
  Navigator.of(context).pushAndRemoveUntil(
    /// 回到指定路由
      MaterialPageRoute(builder: (context) => routeName),
      /// 清空路由
          (route) => route == null
  );
}