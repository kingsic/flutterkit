import 'package:flutter/material.dart';

class TabbarItem extends BottomNavigationBarItem {
  TabbarItem(String title, Image icon, Image activeIcon):
      super(
        label: title,
        icon: icon,
        activeIcon: activeIcon
      );
}