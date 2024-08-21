part of 'local_article_bloc.dart';

abstract class LocalArticleState extends Equatable {
  final List<NewsArticleEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone(List<NewsArticleEntity> articles)
      : super(articles: articles);
}
