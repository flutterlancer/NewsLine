import 'dart:async';

import 'package:newsapp/core/data_state.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/news/domain/entities/article_entity.dart';
import 'package:newsapp/features/news/domain/repository/news_article.dart';

class GetNewsArticlesUseCase
    extends UseCase<DataState<List<NewsArticleEntity>>, void> {
  final NewsArticleRepository _articleRepository;

  GetNewsArticlesUseCase(this._articleRepository);

  @override
  Future<DataState<List<NewsArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
