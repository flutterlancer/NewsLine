import 'package:floor/floor.dart';
import 'package:newsapp/core/constants.dart';
import 'package:newsapp/features/news/domain/entities/article_entity.dart';

@Entity(tableName: "News", primaryKeys: ['id'])
class NewsArticleModel extends NewsArticleEntity {
  const NewsArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> map) {
    return NewsArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != ""
          ? map['urlToImage']
          : kDefaultImage,
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  factory NewsArticleModel.fromEntity(NewsArticleEntity entity) {
    return NewsArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}
