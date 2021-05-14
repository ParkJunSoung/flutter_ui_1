import 'package:flutter/material.dart';
import 'package:flutter_ui_1/model/news_in_fo.dart';
import 'package:flutter_ui_1/repository/news_repository.dart';
import 'package:flutter_ui_1/ui/detail/detail_page.dart';
import 'package:provider/provider.dart';

class BodyMid extends StatefulWidget {
  Result news;
  BodyMid(this.news);

  @override
  _HomeBodyTopSubState createState() => _HomeBodyTopSubState();
}

class _HomeBodyTopSubState extends State<BodyMid> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(widget.news)));
      },
      child: SizedBox(
        child: ListTile(
          leading: Image.network(
              "${widget.news.publication.logoUrl}"),
          title: Text('${widget.news.title}'),
          subtitle: Text('${widget.news.metadata.date} - ${widget.news.metadata.readTimeMinutes} min read'),
          trailing: IconButton(
            alignment: Alignment.centerRight,
            icon: context.read<NewsRepositore>().bookMark.contains(widget.news.id)
                ? Icon(Icons.bookmark)
                : Icon(Icons.bookmark_border),
            onPressed: () {
              setState(() {
                if (context.read<NewsRepositore>().bookMark.contains(widget.news.id)) {
                  context.read<NewsRepositore>().bookMark.remove(widget.news.id);
                } else context.read<NewsRepositore>().bookMark.add(widget.news.id);
              });
            },
          ),
        ),
      ),
    );
  }
}