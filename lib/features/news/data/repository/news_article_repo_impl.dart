import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:newsapp/core/constants.dart';
import 'package:newsapp/core/data_state.dart';
import 'package:newsapp/features/news/data/models/news_article.dart';
import 'package:newsapp/features/news/data/source/local/news_database.dart';
import 'package:newsapp/features/news/domain/entities/article_entity.dart';
import 'package:newsapp/features/news/domain/repository/news_article.dart';

import '../source/remote/news_api_service.dart';

class NewsArticleRepoImpl extends NewsArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  NewsArticleRepoImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<NewsArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: httpResponse.data);
      } else {
        return DataFailed(error: httpResponse.response.statusMessage);
      }
    } on DioException catch (e) {
      return DataFailed(error: e.message);
    }
  }

  @override
  Future<List<NewsArticleModel>> getSavedArticles() async {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(NewsArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(NewsArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(NewsArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(NewsArticleModel.fromEntity(article));
  }
}
