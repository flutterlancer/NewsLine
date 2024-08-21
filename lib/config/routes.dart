import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const /*DailyNews*/ Scaffold());

      case '/ArticleDetails':
        return _materialRoute(
          const Scaffold(),
          // ArticleDetailsView(article: settings.arguments as ArticleEntity),
        );

      case '/SavedArticles':
        return _materialRoute(
          const Scaffold(),
          // const SavedArticles(),
        );

      default:
        return _materialRoute(
          const Scaffold(),
          // const DailyNews(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
