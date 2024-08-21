import 'dart:async';

import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/news/domain/entities/article_entity.dart';
import 'package:newsapp/features/news/domain/repository/news_article.dart';

class GetSavedArticleUseCase implements UseCase<List<NewsArticleEntity>, void> {
  final NewsArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<NewsArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
