import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/app_size.dart';
import 'package:flutter_desktop_exapmle/example_page.dart';
import 'package:flutter_desktop_exapmle/home_page.dart';
import 'package:flutter_desktop_exapmle/person_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            unselectedLabelColor: const Color.fromRGBO(135, 135, 135, 1),
            labelColor: Colors.black,
            tabs: [
              _tabBarForm(title: '홈', icon: Icons.grid_4x4_rounded),
              _tabBarForm(title: '회원', icon: Icons.account_box_rounded),
              _tabBarForm(title: '임금', icon: Icons.calculate_rounded),
            ],
          ),
        ),
        body: TabBarView(children: [
          // HomePage(),
          MyHomePage(),
          PersonPage(),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          )
        ]),
      ),
    );
  }

  Tab _tabBarForm({
    required String title,
    required IconData icon,
  }) {
    return Tab(
      text: title,
      icon: Icon(icon),
    );
  }
}
