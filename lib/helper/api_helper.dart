import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<NewsModel?> fetchAllNews({required String Category}) async {
    String baseurl =
        "https://newsapi.org/v2/top-headlines?country=in&category=$Category&apiKey=5364b448d6ea422eb32e4f2ff910a2d8";

    http.Response res = await http.get(Uri.parse(baseurl));

    if (res.statusCode == 200) {
      String data = res.body;

      Map decodedData = jsonDecode(data);

      NewsModel allnews = NewsModel.fromMap(data: decodedData);

      return allnews;
    }
  }
}
