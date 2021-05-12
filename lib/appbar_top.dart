import 'package:flutter/material.dart';
import 'package:flutter_ui_1/interests.dart';
import 'package:flutter_ui_1/main.dart';

class AppbarTop extends StatefulWidget {
  const AppbarTop({Key key}) : super(key: key);

  @override
  _AppbarTopState createState() => _AppbarTopState();
}

class _AppbarTopState extends State<AppbarTop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'Interests',),
              ],
            ),
            title: Text('TABS TITLE TEXT'),
          ),
          body: TabBarView(
            children: [
              MyHomePage(),
              Interests(),
            ],
          ),
        ),
      ),
    );
  }
}


