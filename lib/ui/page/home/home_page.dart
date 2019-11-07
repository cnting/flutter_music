import 'package:flutter/material.dart';
import 'package:flutter_music/ui/page/home/home_drawer.dart';

import '../mine/mine_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabs = ['我的', '发现', '云村', '视频'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
            titleSpacing: 0,
            title: TabBar(
              labelPadding: const EdgeInsets.all(0),
              tabs: tabs.map((tab) => Text(tab)).toList(),
              labelColor: Colors.black54,
              labelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black38,
              unselectedLabelStyle: const TextStyle(fontSize: 16),
              indicatorColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {},
              )
            ],
          ),
          drawer: homeDrawer(context),
          body: TabBarView(
            children: <Widget>[
              MinePage(),
              Center(
                child: Text('1'),
              ),
              Center(
                child: Text('2'),
              ),
              Center(
                child: Text('3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
