import 'package:flutter/material.dart';

class PeopleInfo extends StatelessWidget {
  const PeopleInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class PublicationsInfo extends StatelessWidget {
  const PublicationsInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class TopicsInfo extends StatefulWidget {
  @override
  _TopicsInfoState createState() => _TopicsInfoState();
}

class _TopicsInfoState extends State<TopicsInfo> {
  var tmpArray = [];

  Map<String, bool> android = {
    "Jetpack Compose": false,
    "Kotlin": false,
    "Jetpack": false,
  };

  Map<String, bool> programming = {
    "Kotlin": false,
    "Declarative UIs": false,
    "Java": false,
    "Dart": false,
    "HTML": false,
  };
  Map<String, bool> Technology = {
    "Kotlin2": false,
    "Declarative UIs2": false,
    "Java2": false,
    "Dart2": false,
    "HTML2": false,
  };

  getCheckboxItems() {
    android.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: SizedBox(
              height: 200,
              child: Column(children: <Widget>[
                Text(
                  "Android",
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const  NeverScrollableScrollPhysics(),
                    children: android.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(key),
                        value: android[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool value) {
                          setState(() {
                            android[key] = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),
          ),
          Container(
            child: SizedBox(
              height: 350,
              child: Column(children: <Widget>[
                Text(
                  "programming",
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const  NeverScrollableScrollPhysics(),
                    children: programming.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(key),
                        value: programming[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool value) {
                          setState(() {
                            programming[key] = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),
          ),
          Container(
            child: SizedBox(
              height: 300,
              child: Column(children: <Widget>[
                Text(
                  "Technology",
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const  NeverScrollableScrollPhysics(),
                    children: Technology.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(key),
                        value: Technology[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool value) {
                          setState(() {
                            Technology[key] = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}