import 'dart:convert';

import 'package:pfaflutter/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news =[];
  Future<void> getNews() async{

    String  newsurl="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a62dfc04b859421692e4a8c146de045d";
    var  url =Uri.parse(newsurl);

    var response= await http.get(url);
    var jsonData=jsonDecode(response.body);
if(jsonData['status']=="ok"){
  jsonData["articles"].forEach((element){
    if(element["urlToImage"]!=null && element["description"]!=null&& element["title"]!=null ){
      ArticleModel articleModel= ArticleModel(
        img:  element["urlToImage"],
        title: element["title"],
        description: element["description"],
      );
      news.add(articleModel);
    }
  });
}
  }

}
