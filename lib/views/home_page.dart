import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

const List<Tab> _tabs = [
  Tab(text: "关注",),
  Tab(text: "推荐",),
  Tab(text: "热榜",),
  Tab(text: "财经",),
  Tab(text: "问答",),
  Tab(text: "科技",),
  Tab(text: "要闻",),
  Tab(text: "视频",),
  Tab(text: "娱乐",),
];

final List<Widget> _tabsContent = [
  Text("关注"),
  Text("推荐"),
  Text("热榜"),
  Text("财经"),
  Text("问答"),
  Text("科技"),
  Text("要闻"),
  Text("视频"),
  Text("娱乐"),
];

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: _tabs.length,
        vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(44),
            child: Material(
              color: Colors.white70,
              child: TabBar(
                tabs: _tabs,
                controller: _tabController,
                isScrollable: true,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: _tabsContent,
          controller: _tabController,
        )
    );
  }
}
