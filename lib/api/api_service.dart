import 'dart:convert';
import 'package:flutter_fundamental_dicoding/models/article.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '242c2e480b37402296b35d3bc94222c0';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(
        "${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}

// newsapi.org api key 242c2e480b37402296b35d3bc94222c0

String url =
    "http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=242c2e480b37402296b35d3bc94222c0";
