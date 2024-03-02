import 'package:flutter/material.dart';
import 'package:inflearn_cf_tab_bar/const/tabs.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: TABS.length,
      vsync: this, // this is the TickerProvider
    );
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar'),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map((tab) => Center(
              child: Icon(tab.icon, size: 100),
            ))
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true, // default: true
        showUnselectedLabels: true, // default: true
        currentIndex: tabController.index,
        type: BottomNavigationBarType.fixed,
        items: TABS
            .map((tab) => BottomNavigationBarItem(
              icon: Icon(tab.icon),
              label: tab.label,
            ))
            .toList(),
        onTap: (index) {
          tabController.animateTo(index);
        },
      ),
    );
  }
}
