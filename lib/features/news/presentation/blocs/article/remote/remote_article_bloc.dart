import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/data_state.dart';
import 'package:newsapp/features/news/domain/entities/article_entity.dart';
import 'package:newsapp/features/news/domain/usecases/get_aticles.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetNewsArticlesUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetRemoteArticles>(onGetArticles);
  }

  void onGetArticles(
    _,
    Emitter<RemoteArticlesState> emit,
  ) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
