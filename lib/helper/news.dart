import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=2869026f022343b695a9f79d574ec2e0";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    print(jsonData);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
            source: element["source"]['name'],
          );
          news.add(article);
        }
      });
    } else {
      //print('status error');
      return true;
    }
  }
}

class CategoryNewss {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=2869026f022343b695a9f79d574ec2e0";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    print(jsonData);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
            source: element["source"]['name'],
          );
          news.add(article);
        }
      });
    } else {
      //print('status error');
      return true;
    }
  }
}
