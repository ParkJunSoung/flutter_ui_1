import 'package:flutter/material.dart';
import 'package:flutter_ui_1/model/news_in_fo.dart';


class BodyLow extends StatelessWidget {
  Result news;

  BodyLow(this.news);

  // Text("BASED ON YOUR HISTORY"),

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListTile(
        leading: Image.network("${news.publication.logoUrl}"),
        title: Text(
          'BASED ON YOUR HISTORY \n${news.title}',
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Text(
            '${news.metadata.date} - ${news.metadata.readTimeMinutes} min read'),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ),
    );
  }
}
