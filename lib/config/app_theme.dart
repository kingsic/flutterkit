import 'package:flutter/material.dart';
import 'package:flutterkit/config/app_colors.dart';

final ThemeData themeData = ThemeData(
  /// 主题色
  primaryColor: AppColors.primary,
  /// 页面背景色
  scaffoldBackgroundColor: AppColors.page,
  /// 取消水波纹效果
  splashColor: Colors.transparent,
  /// 取消高亮效果
  highlightColor: Colors.transparent,

  /// appBar 的主题
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    elevation: 0,
  ),

  /// tabBar 的主题
  tabBarTheme: TabBarTheme(
    labelColor: Colors.red,
    unselectedLabelColor: Colors.black,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontSize: 15,
    )
  ),
  /// tabBar 底部指示器颜色
  indicatorColor: Colors.red,

  /// bottomNavigationBar 的主题
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.nav,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle (
      fontSize: 12,
    )
  ),

  /// 主题文字颜色配置
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: AppColors.c7B7B7B// 文字颜色
    )
  )
);
