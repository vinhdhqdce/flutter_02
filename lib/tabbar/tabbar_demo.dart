import 'blue_screen.dart';
import 'package:flutter/material.dart';

import 'red_screen.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  //add with for tab

  final screens = <Widget>[];
  final items = <Text>[];

  late TabController tabController;

  var currentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    screens.add(BlueScreen());
    screens.add(RedScreen());

    items.add(Text('Blue'));
    items.add(Text('Red'));

    tabController =
        TabController(initialIndex: 0, length: items.length, vsync: this);
    tabController.addListener(() {
      print('init');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar demo'),
      ),
      body: Column(
        children: [
          buildTabBar(),
          Expanded(child: buildBody()),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return TabBar(
        tabs: items,
        controller: tabController,
        indicatorColor: Colors.red,
        labelColor: Colors.grey,
        onTap: (index) {
          if (index != currentTabIndex) {
            setState(() {
              currentTabIndex = index;
            });
          }
        });
  }

  Widget buildBody() {
    /*return IndexedStack(
      index: currentTabIndex,
      children: screens,
    );*/
  return TabBarView(children: screens,controller: tabController,);
  }
}
