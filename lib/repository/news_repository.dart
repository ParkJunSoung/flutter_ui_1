import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_1/model/news_in_fo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsRepositore extends ChangeNotifier {
  List<Result> _news = [];
  List<String> _peoples = [];

  List<String> _publications = [];

  bool _isTab = true;

  bool _isLoading = true;

  bool _isPressed = true;

  final Set<int> checked = {};

  final Set<String> bookMark = {};

  final Set<String> like = {};

  List<Result> get news => _news;

  List<String> get peoples => _peoples;

  List<String> get publications => _publications;

  bool get isTab => _isTab;

  bool get isLoading => _isLoading;

  bool get isPressed => _isPressed;

  void tabbed() {
    _isTab = !_isTab;
    notifyListeners();
  }

  void loading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void pressed() {
    _isPressed = !_isPressed;
    notifyListeners();
  }

  List<String> people() {
    for(int i = 0; i < _news.length; i++) {
      _peoples.add(_news[i].metadata.author.name);
    }
    return _peoples;
  }
  List<String> publication() {
    for(int i = 0; i < _news.length; i++) {
      _publications.add(_news[i].publication.name);
    }
    return _publications;
  }


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


}