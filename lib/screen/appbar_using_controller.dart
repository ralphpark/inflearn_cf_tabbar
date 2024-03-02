import 'package:flutter/material.dart';
import 'package:inflearn_cf_tab_bar/const/tabs.dart';

class AppbarUsingController extends StatefulWidget {
  const AppbarUsingController({super.key});

  @override
  State<AppbarUsingController> createState() => _AppbarUsingControllerState();
}

class _AppbarUsingControllerState extends State<AppbarUsingController>
    with TickerProviderStateMixin {
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
    }
    );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Appbar Using Controller'),
          bottom: TabBar(
            controller: tabController,
            tabs: TABS.map((tab) => Tab(icon: Icon(tab.icon))).toList(),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: TABS
              .map((tab) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(tab.icon, size: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (tabController.index != 0)
                            ElevatedButton(
                              onPressed: () {
                                tabController.animateTo(
                                  tabController.index - 1,
                                );
                              },
                              child: Text('이전'),
                            ),
                            const SizedBox(width: 16),
                          if (tabController.index != TABS.length - 1)
                            ElevatedButton(
                              onPressed: () {
                                tabController.animateTo(
                                  tabController.index + 1,
                                );
                              },
                              child: Text('다음'),
                            ),
                        ],
                      )
                    ],
                  ))
              .toList(),
        ));
  }
}
