import 'package:flutter/material.dart';
import 'package:flutter_ui_1/repository/news_repository.dart';
import 'package:flutter_ui_1/ui/body/body_low.dart';
import 'package:flutter_ui_1/ui/body/body_mid.dart';
import 'package:flutter_ui_1/ui/body/body_slider.dart';
import 'package:flutter_ui_1/ui/body/body_top.dart';
import 'package:flutter_ui_1/ui/body/menu_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context
      ) {
    return context.read<NewsRepositore>().isLoading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
      appBar: AppBar(
        title: Text('Jetnews'),
      ),
      drawer: Drawer(
        child: MenuBar(),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTop(context.read<NewsRepositore>().news[2]),
              BodyMid(context.read<NewsRepositore>().news[3]),
              BodyMid(context.read<NewsRepositore>().news[4]),
              BodySlider(context.read<NewsRepositore>().news),
              BodyLow(context.read<NewsRepositore>().news[5]),
              BodyLow(context.read<NewsRepositore>().news[6]),
              BodyLow(context.read<NewsRepositore>().news[7]),


            ],
          ),
        ),
      ),
    );
  }
}