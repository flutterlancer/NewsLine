import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/config/app_theme.dart';
import 'package:newsapp/config/routes.dart';
import 'package:newsapp/features/news/presentation/blocs/article/remote/remote_article_bloc.dart';
import 'package:newsapp/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RemoteArticleBloc>(
            create: (context) =>
                sl<RemoteArticleBloc>()..add(const GetRemoteArticles()),
          ),
        ],
        child: const _MainAppWidget(),
      ),
    );
  }
}

class _MainAppWidget extends StatelessWidget {
  const _MainAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (n) {
        n.disallowIndicator();
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: appTheme(),
        initialRoute: "/",
      ),
    );
  }
}
