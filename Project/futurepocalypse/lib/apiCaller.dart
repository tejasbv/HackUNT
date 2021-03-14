import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsAPI {
  String url =
      "https://newsapi.org/v2/everything?q=texasstorm&sortBy=popularity&apiKey=a68e9ebfe08947f8a04adc21e6dc5f2a";
  NewsAPI() {
    getinfo();
  }

  getinfo() async {
    var thing = fetchnews();
    thing.then((news) {
      print("hello");
    });
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    print(position.toString());
  }

  Future<List<News>> fetchnews() async {
    final response = await http.get(
        "https://newsapi.org/v2/everything?q=plano-disaster&sortBy=popularity&apiKey=a68e9ebfe08947f8a04adc21e6dc5f2a");
    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception("api call invalid");
    }
  }
}

class News {
  var description;
  var imageURL;
  var url;
  var title;
  News(this.title, this.url, this.imageURL, this.description);
  static List<News> fromJson(Map<String, dynamic> json) {
    List<News> newss = [];
    int vals = int.parse(json["totalResults"].toString());
    for (int i = 0; i < (vals > 20 ? 20 : vals); i++) {
      newss.add(News(
          json["articles"][i]["title"],
          json["articles"][i]["url"],
          json["articles"][i]["urlToImage"],
          json["articles"][i]["description"]));
    }
    return newss;
  }
}
