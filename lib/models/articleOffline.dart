import 'dart:convert';

class ArticleOffline {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleOffline({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleOffline.fromJson(Map<String, dynamic> article) =>
      ArticleOffline(
        author: article['author'],
        title: article['title'],
        description: article['description'],
        url: article['url'],
        urlToImage: article['urlToImage'],
        publishedAt: article['publishedAt'],
        content: article['content'],
      );

  // List<Article> parseArticles(String? json) {
  //   if (json == null) {
  //     return [];
  //   }

  //   final List parsed = jsonDecode(json);
  //   return parsed.map((json) => Article.fromJson(json)).toList();
  // }
}
