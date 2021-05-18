import 'package:flutter/material.dart';
import 'package:flutterkit/views/active_page.dart';
import 'package:flutterkit/views/home_page.dart';
import 'package:flutterkit/views/mine_page.dart';
import 'package:flutterkit/views/order_page.dart';
import 'package:flutterkit/views/student_page.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RootPageState();
  }
}

const Map<String, String> _bottomNames = {
  "home": "首页",
  "active": "活动",
  "order": "",
  "student": "学员",
  "mine": "我的",
};

class RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    ActivePage(),
    OrderPage(),
    StudentPage(),
    MinePage()
  ];
  final List<BottomNavigationBarItem> _bottomNavigationBarItemList = [];

  @override
  void initState() {
    super.initState();
    
    _bottomNames.forEach((key, value) {
      _bottomNavigationBarItemList.add(_bottomNavigationBarItem(key, value));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItemList,
        currentIndex: _currentIndex,
        onTap: _onTapClick,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: _orderButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String key, String value) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          "assets/images/tabbar/$key.png",
          width: 25,
          height: 25,
        ),
        activeIcon: Image.asset(
          "assets/images/tabbar/${key}_active.png",
          width: 25,
          height: 25,
        ),
      label: value,
      tooltip: "",
    );
  }

  Widget _orderButton() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 50,
      height: 50,
      child: FloatingActionButton(
        child: Image.asset("assets/images/tabbar/order.png",),
          onPressed: _orderButtonClick,
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  /// 底部切换方法
  void _onTapClick(int index) {
    if (index == 2) {
      return _orderButtonClick();
    }
    setState(() {
      _currentIndex = index;
    });
  }

  void _orderButtonClick() {
    print("_orderButtonClick");
    // setState(() {
    //   _currentIndex = 2;
    // });
  }
}