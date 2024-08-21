import 'package:flutter/material.dart';
import 'package:newsapp/features/news/domain/entities/article_entity.dart';
import 'package:newsapp/features/news/presentation/views/article_details/article_details.dart';
import 'package:newsapp/features/news/presentation/views/daily_news/daily_news.dart';
import 'package:newsapp/features/news/presentation/views/saved_articles/saved_articles.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _pageRoute(const DailyNews());

      case '/ArticleDetails':
        return _pageRoute(
          ArticleDetailsView(article: settings.arguments as NewsArticleEntity),
        );

      case '/SavedArticles':
        return _pageRoute(const SavedArticles());

      default:
        return _pageRoute(const DailyNews());
    }
  }

  static PageRouteBuilder _pageRoute(Widget child,
          {bool fullScreenDialog = false}) =>
      PageRouteBuilder(
        fullscreenDialog: fullScreenDialog,
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween<Offset>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));

          return FadeTransition(
            opacity: animation, // Use the same animation for both transitions
            child: SlideTransition(
              position: animation.drive(tween),
              child: child,
            ),
          );
        },
      );
}
