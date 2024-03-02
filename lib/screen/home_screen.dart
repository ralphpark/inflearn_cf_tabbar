import 'package:flutter/material.dart';
import 'package:inflearn_cf_tab_bar/screen/appbar_using_controller.dart';
import 'package:inflearn_cf_tab_bar/screen/basic_appbar_tabbar_screen.dart';
import 'package:inflearn_cf_tab_bar/screen/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BasicAppbarTabbarScreen()
                    ),
                  );
                },
                child: Text('Basic AppBar Tab Bar Screen')
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AppbarUsingController()
                      ),
                    );
                  },
                  child: Text('Appbar Using Controller')
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationBarScreen()
                      ),
                    );
                  },
                  child: Text('Bottom Navigation Bar')
              ),
            ],
          ),
        ));
  }
}
