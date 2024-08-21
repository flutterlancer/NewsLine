import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/news/presentation/blocs/article/local/local_article_bloc.dart';
import 'package:newsapp/features/news/presentation/blocs/article/remote/remote_article_bloc.dart';

extension BlocExt on BuildContext {
  RemoteArticleBloc get remoteArticleBloc => read<RemoteArticleBloc>();
  LocalArticleBloc get localArticleBloc => read<LocalArticleBloc>();
}
