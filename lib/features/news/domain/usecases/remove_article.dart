import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/news/domain/entities/article_entity.dart';
import 'package:newsapp/features/news/domain/repository/news_article.dart';

class RemoveArticleUseCase implements UseCase<void, NewsArticleEntity> {
  final NewsArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({NewsArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
