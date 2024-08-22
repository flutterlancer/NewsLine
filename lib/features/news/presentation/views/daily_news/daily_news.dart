import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/extensions/context.dart';

import '../../blocs/article/remote/remote_article_bloc.dart';
import '../../widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        'NewsLine',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 18.sp,
          fontFamily: "Inter",
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.remoteArticleBloc.add(const GetRemoteArticles());
      },
      child: BlocBuilder<RemoteArticleBloc, RemoteArticlesState>(
        builder: (_, state) {
          if (state is RemoteArticlesLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 1),
            );
          }
          if (state is RemoteArticlesError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    state.error!,
                    textAlign: TextAlign.center,
                  ),
                ),
                16.verticalSpace,
                const SizedBox(),
                TextButton(
                  onPressed: () =>
                      context.remoteArticleBloc.add(const GetRemoteArticles()),
                  child: const Text(
                    'Try again',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            );
          }
          if (state is RemoteArticlesDone) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleWidget(article: state.articles![index]);
              },
              itemCount: state.articles!.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
