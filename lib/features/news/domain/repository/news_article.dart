import 'package:newsapp/core/data_state.dart';
import 'package:newsapp/features/news/domain/entities/article_entity.dart';

abstract class NewsArticleRepository {
  // API methods
  Future<DataState<List<NewsArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<NewsArticleEntity>> getSavedArticles();

  Future<void> saveArticle(NewsArticleEntity article);

  Future<void> removeArticle(NewsArticleEntity article);
}
