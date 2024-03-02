import 'package:flutter/material.dart';
import 'package:inflearn_cf_tab_bar/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child:
        Scaffold(
          appBar: AppBar(
            title: Text('Basic AppBar Tab Bar Screen'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabBar(
                    tabAlignment: TabAlignment.center,
                    indicatorColor: Colors.red,
                    indicatorWeight: 5,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                    tabs:
                    TABS.map((tab) => Tab(
                      icon: Icon(tab.icon),
                      text: tab.label,
                    )).toList(),
                  ),
                ],
              ),
            )
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: TABS.map((tab) => Center(child: Icon(tab.icon))).toList(),
          ),
      ),
    );
  }
}
