import 'package:flutter/foundation.dart';
import 'package:flutter_ui_1/modle/data.dart';
import 'package:http/http.dart'as http ;
import 'dart:convert';

class NewsRepositore extends ChangeNotifier {
  List<Result> _news = [];
  Future<NewsInfo> fetchData() async {
    var uri = Uri.parse('https://junho1124.github.io/web_test/posts.json');
    var response = await http.get(uri);
    NewsInfo result = NewsInfo.fromJson(json.decode(response.body));
    for (int i = 0; i < result.result.length; i++) {
      _news.add(result.result[i]);
    }
    notifyListeners();
    return result;
  }
  List<Result> get news => _news;
}