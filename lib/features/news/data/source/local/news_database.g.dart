// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $NewsDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $NewsDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $NewsDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<NewsDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorNewsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $NewsDatabaseBuilderContract databaseBuilder(String name) =>
      _$NewsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $NewsDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$NewsDatabaseBuilder(null);
}

class _$NewsDatabaseBuilder implements $NewsDatabaseBuilderContract {
  _$NewsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $NewsDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $NewsDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<NewsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$NewsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$NewsDatabase extends NewsDatabase {
  _$NewsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NewsArticleDao? _articleDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `News` (`id` INTEGER, `author` TEXT, `title` TEXT, `description` TEXT, `url` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NewsArticleDao get articleDAO {
    return _articleDAOInstance ??= _$NewsArticleDao(database, changeListener);
  }
}

class _$NewsArticleDao extends NewsArticleDao {
  _$NewsArticleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _newsArticleModelInsertionAdapter = InsertionAdapter(
            database,
            'News',
            (NewsArticleModel item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                }),
        _newsArticleModelDeletionAdapter = DeletionAdapter(
            database,
            'News',
            ['id'],
            (NewsArticleModel item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<NewsArticleModel> _newsArticleModelInsertionAdapter;

  final DeletionAdapter<NewsArticleModel> _newsArticleModelDeletionAdapter;

  @override
  Future<List<NewsArticleModel>> getArticles() async {
    return _queryAdapter.queryList('SELECT * FROM News',
        mapper: (Map<String, Object?> row) => NewsArticleModel(
            id: row['id'] as int?,
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?,
            publishedAt: row['publishedAt'] as String?,
            content: row['content'] as String?));
  }

  @override
  Future<void> insertArticle(NewsArticleModel article) async {
    await _newsArticleModelInsertionAdapter.insert(
        article, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteArticle(NewsArticleModel articleModel) async {
    await _newsArticleModelDeletionAdapter.delete(articleModel);
  }
}
