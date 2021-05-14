import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_1/model/news_in_fo.dart';


class BodySlider extends StatelessWidget {
  final  List<Result> news;
  BodySlider(this.news);

  @override
  Widget build(BuildContext context) {
    List<NewWidget> items = [];
    for (int i = 0; i < news.length; i++) {
      items.add(NewWidget(news: news[i]));
    }
    return CarouselSlider(items: items, options: CarouselOptions(
      enableInfiniteScroll: false,
    ));

  }

}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.news,
  }) : super(key: key);

  final Result news;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            "${news.publication.logoUrl}",width: 100,height: 100,),
          ListTile(
            title: Text('${news.title}'),
            subtitle: Text('${news.metadata.date} - ${news.metadata.readTimeMinutes} min read'),
          ),
        ],
      ),
    );
  }
}