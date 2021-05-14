import 'package:flutter/material.dart';
import 'package:flutter_ui_1/model/news_in_fo.dart';
import 'package:flutter_ui_1/repository/news_repository.dart';
import 'package:provider/provider.dart';

class DetailBottom extends StatefulWidget {
  DetailBottom(this.news);

  Result news;

  @override
  _DetailBottomState createState() => _DetailBottomState();
}

class _DetailBottomState extends State<DetailBottom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.0,),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IconButton(
                  icon: context.read<NewsRepositore>().like.contains(widget.news.id)
                      ? Icon(Icons.favorite,
                    size: 30,)
                      : Icon(Icons.favorite_border,
                    size: 30,),
                  onPressed: () {
                    setState(() {
                      if (context.read<NewsRepositore>().like.contains(widget.news.id)) {
                        context.read<NewsRepositore>().like.remove(widget.news.id);
                      } else context.read<NewsRepositore>().like.add(widget.news.id);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: context.read<NewsRepositore>().bookMark.contains(widget.news.id)
                      ? Icon(Icons.bookmark,
                    size: 30,)
                      : Icon(Icons.bookmark_border,
                    size: 30,),
                  onPressed: () {
                    setState(() {
                      if (context.read<NewsRepositore>().bookMark.contains(widget.news.id)) {
                        context.read<NewsRepositore>().bookMark.remove(widget.news.id);
                      } else context.read<NewsRepositore>().bookMark.add(widget.news.id);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.share_rounded,
                    size: 30,),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.text_fields,
                  size: 30,),
              ],
            )
        ),
        SizedBox(width: 16.0,),
      ],
    );
  }
}