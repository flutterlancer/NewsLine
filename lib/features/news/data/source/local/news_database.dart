import 'dart:async';

import 'package:floor/floor.dart';
import 'package:newsapp/features/news/data/models/news_article.dart';
import 'package:newsapp/features/news/data/source/local/dao/news_article_dao.dart';
// ignore: unused_import
import 'package:sqflite/sqflite.dart' as sqflite;

part 'news_database.g.dart';

@Database(version: 1, entities: [NewsArticleModel])
abstract class AppDatabase extends FloorDatabase {
  NewsArticleDao get articleDAO;
}
