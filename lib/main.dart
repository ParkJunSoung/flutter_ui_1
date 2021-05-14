import 'package:flutter/material.dart';
import 'package:flutter_ui_1/repository/news_repository.dart';
import 'package:flutter_ui_1/ui/body/home.dart';
import 'package:flutter_ui_1/ui/interest/interest.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<NewsRepositore>(create: (_) => NewsRepositore()),
        ],
        child: MyApp(),
      ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    context.read<NewsRepositore>().fetchData().then((jetNewsResult) {
      setState(() {
        context.read<NewsRepositore>().people();
        context.read<NewsRepositore>().publication();
        for (int i = 0; i < jetNewsResult.result.length; i++) {
          context.read<NewsRepositore>().news.add(jetNewsResult.result[i]);
        }
        context.read<NewsRepositore>().loading();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Consumer<NewsRepositore>(
          builder: (BuildContext context, JetNewsProvider, Widget child) {
            return JetNewsProvider.isTab ? Home() : Interests();
          },
        ));
  }
}