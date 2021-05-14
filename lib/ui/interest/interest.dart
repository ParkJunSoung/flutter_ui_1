import 'package:flutter/material.dart';
import 'package:flutter_ui_1/ui/body/menu_bar.dart';
import 'package:flutter_ui_1/ui/interest/interst_page.dart';

class Interests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          ),

      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Interests'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Topics'),
                Tab(text: 'People',),
                Tab(text: 'Publications'),
              ],
            ),
          ),
          drawer: Drawer(
            child: MenuBar(),),
          body: TabBarView(
            children: [
              TopicsInfo(),
              PeopleInfo(),
              PublicationsInfo(),
            ],
          ),
        ),
      ),
    );
  }
}