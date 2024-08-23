import 'package:floor/floor.dart';
import 'package:newsapp/features/news/data/models/news_article.dart';

@dao
abstract class NewsArticleDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertArticle(NewsArticleModel article);

  @delete
  Future<void> deleteArticle(NewsArticleModel articleModel);

  @Query('SELECT * FROM News')
  Future<List<NewsArticleModel>> getArticles();
}
