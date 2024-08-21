part of 'remote_article_bloc.dart';

sealed class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

class GetRemoteArticles extends RemoteArticlesEvent {
  const GetRemoteArticles();
}
