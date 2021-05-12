import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ui_1/detail_page.dart';
import 'package:flutter_ui_1/interests.dart';
import 'package:flutter_ui_1/modle/data.dart';
import 'package:flutter_ui_1/modle/data_info.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   Result news;
   // MyHomePage(this.news);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
        title: Text(''),
      ),
      drawer: Drawer(
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
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Interests'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Interests()),
                  );
                },
              )
            ],
          )
        ],
      )),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
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
                      "https://image.flaticon.com/icons/png/512/2565/2565977.png",
                      width: 100,
                      height: 100,
                    ),
                    ListTile(
                      title: Text('A Little Thing about Android Module Paths'),
                      subtitle: Text('pietro Maggi - 1min read'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.network(
                "https://image.flaticon.com/icons/png/512/2565/2565977.png"),
            title: Text('A Little Thing about Android Module Paths'),
            subtitle: Text('pietro Maggi - 1min read'),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Image.network(
                "https://image.flaticon.com/icons/png/512/2565/2565977.png"),
            title: Text('A Little Thing about Android Module Paths'),
            subtitle: Text('pietro Maggi - 1min read'),
            trailing: IconButton(

              icon: Icon(Icons.more_vert),
              onPressed: () {},

            ),
          ),
          ListTile(
            leading: Image.network(
                "https://image.flaticon.com/icons/png/512/2565/2565977.png"),
            title: Text('A Little Thing about Android Module Paths'),
            subtitle: Text('pietro Maggi - 1min read'),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
