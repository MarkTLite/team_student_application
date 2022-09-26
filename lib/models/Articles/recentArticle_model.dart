import 'dart:math';

class RecentArticleModel {
  final String image;
  final String category;
  final String title;
  final String date;
  final String summary;
  Map<String, dynamic> articleMap = {};
  late final String articleId;

  RecentArticleModel(
      {required this.image,
      required this.category,
      required this.title,
      required this.date,
      required this.summary}) {
    articleId = Random().nextInt(10000).toString();
  }

  Map<String, dynamic> toJson() {
    articleMap = {
      "image": image,
      "category": category,
      "title": title,
      "uploadDate": date,
      "story": summary,
      "id": articleId,
      'userLikes': []
    };
    return articleMap;
  }
}
