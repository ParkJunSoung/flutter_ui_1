import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ui_1/modle/data.dart';
import 'package:flutter_ui_1/modle/data_info.dart';
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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);


  @override

  _MyHomePageState createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage> {
  Result news;
  @override
  void initState() {
    super.initState();
    context.read<NewsRepositore>().fetchData().then((NewsInfo) {
      setState(() {
        for (int i = 0; i < NewsInfo.result.length; i++) {
          context.read<NewsRepositore>().news.add(NewsInfo.result[i]);
        }
        print(context.read<NewsRepositore>().news[0]);
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('news.title'),
      ),
      drawer: Container(
        child: Drawer(
            child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.red),
              child: ListTile(
                title: Text(
                  'jetnews',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        )),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Top stories for you',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Image.network(
                "https://blog.kakaocdn.net/dn/btV3Zw/btqX0o3CkV2/tsSKQNEObc2q6HyZYw36s0/img.jpg"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Locale changes and the AndroidViewModel antipattern',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text('jose Alcerreca'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text('April 02 -1 min read'),
              )
            ],
          ),
          ListTile(
            leading: Image.network(
                "https://image.flaticon.com/icons/png/512/2565/2565977.png"),
            title: Text('A Little Thing about Android Module Paths'),
            subtitle: Text('pietro Maggi - 1min read'),
            trailing: IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Image.network(
                "https://image.flaticon.com/icons/png/512/2565/2565977.png"),
            title: Text('A Little Thing about Android Module Paths'),
            subtitle: Text('pietro Maggi - 1min read'),
            trailing: IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ),
          Divider(),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
              ),
              items: [
                Column(
                  children: [
                    Image.network(
                        "https://image.flaticon.com/icons/png/512/2565/2565977.png",width: 100,height: 100,),
                    ListTile(
                      title: Text('A Little Thing about Android Module Paths'),
                      subtitle: Text('pietro Maggi - 1min read'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
