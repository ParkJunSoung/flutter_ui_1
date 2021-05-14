import 'package:flutter/material.dart';
import 'package:flutter_ui_1/model/news_in_fo.dart';


class BodyTop extends StatelessWidget {

  Result news;
  BodyTop(this.news);


  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const  NeverScrollableScrollPhysics(),
      children: [
        ListTile(

          title: Text(
            'Top stories for you',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Image.network(
              "${news.publication.logoUrl}"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                '${news.title}',
                // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                style: textTheme.headline6
                    .copyWith(color: textTheme.headline6.color.withOpacity(0.87)),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text('${news.metadata.author.name}',
                style: textTheme.bodyText2
                    .copyWith(color: textTheme.bodyText2.color.withOpacity(0.87)),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Text('${news.metadata.date} - ${news.metadata.readTimeMinutes} min read',

              ),
            )
          ],
        ),

        Divider(),

      ],
    );
  }
}