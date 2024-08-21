import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/features/news/data/repository/news_article_repo_impl.dart';
import 'package:newsapp/features/news/data/source/remote/news_api_service.dart';
import 'package:newsapp/features/news/domain/repository/news_article.dart';
import 'package:newsapp/features/news/domain/usecases/get_saved_articles.dart';
import 'package:newsapp/features/news/domain/usecases/remove_article.dart';
import 'package:newsapp/features/news/domain/usecases/save_article.dart';
import 'package:newsapp/features/news/presentation/blocs/article/local/local_article_bloc.dart';
import 'package:newsapp/features/news/presentation/blocs/article/remote/remote_article_bloc.dart';

import 'features/news/data/source/local/news_database.dart';
import 'features/news/domain/usecases/get_aticles.dart';

final GetIt sl = GetIt.instance;

Future<void> injectDependencies() async {
  // register database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

// register dio
  sl.registerSingleton<Dio>(Dio());

  // register api service
  sl.registerSingleton<NewsApiService>(
    NewsApiService(sl<Dio>()),
  );

  // register repositories
  sl.registerSingleton<NewsArticleRepository>(
    NewsArticleRepoImpl(sl<NewsApiService>(), sl<AppDatabase>()),
  );

  // register usecases
  sl.registerSingleton<GetNewsArticlesUseCase>(
    GetNewsArticlesUseCase(sl<NewsArticleRepository>()),
  );

  sl.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(sl<NewsArticleRepository>()),
  );

  sl.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(sl<NewsArticleRepository>()),
  );

  sl.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(sl<NewsArticleRepository>()),
  );

  // register blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(sl(), sl(), sl()),
  );
}
