import 'dart:convert';

import 'package:flutter_test_assignment/constants/api.dart';
import 'package:flutter_test_assignment/datasource/fetchable.dart';
import 'package:flutter_test_assignment/models/news_model.dart';

class DataSource extends FetchDataSource {
  List<NewsModel> newsModel = [];

  String title;

  String endpointUrl = API.baseURL;
  String sportUrl = API.sportUrl;
  String techUrl = API.techURL;
  String movieUrl = API.movieURL;

  Future<NewsModel> fetchData() async {
    final response = await fetchPost(endpointUrl);
    print(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    for (Map<String, dynamic> json in responseJson['articles']) {
      NewsModel newsModelss = NewsModel.fromJSON(json);
      newsModel.add(newsModelss);
      notifyListeners();
    }
  }

  Future<NewsModel> fetchDataSports() async {
    final response = await fetchPost(sportUrl);
    print(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    for (Map<String, dynamic> json in responseJson['articles']) {
      NewsModel newsModelss = NewsModel.fromJSON(json);
      newsModel.add(newsModelss);
      notifyListeners();
    }
  }

  Future<NewsModel> fetchDataTech() async {
    final response = await fetchPost(techUrl);
    print(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    for (Map<String, dynamic> json in responseJson['articles']) {
      NewsModel newsModelss = NewsModel.fromJSON(json);
      newsModel.add(newsModelss);
      notifyListeners();
    }
  }

  Future<NewsModel> fetchDataMovie() async {
    final response = await fetchPost(movieUrl);
    print(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    for (Map<String, dynamic> json in responseJson['articles']) {
      NewsModel newsModelss = NewsModel.fromJSON(json);
      newsModel.add(newsModelss);
      notifyListeners();
    }
  }

  NewsModel objectAtIndexPath(int indexPath) {
    if (indexPath < newsModel.length) {
      return newsModel.elementAt(indexPath);
    }
    return null;
  }

  @override
  void resetData() {
    newsModel = null;
    super.resetData();
  }
}
