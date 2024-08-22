part of 'remote_article_bloc.dart';

sealed class RemoteArticlesEvent extends Equatable {
  const RemoteArticlesEvent();
}

class GetRemoteArticles extends RemoteArticlesEvent {
  const GetRemoteArticles();
  @override
  List<Object?> get props => [];
}
