import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_full_learn/showTrack/models/movies_model.dart';

class MoviesDBHelper {
  static final MoviesDBHelper _instance = MoviesDBHelper._internal();
  
  factory MoviesDBHelper() => _instance;

  static Database? _database;

  MoviesDBHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }
  Future<List<MoviesTMDB>> getMoviesFromDB() async {
  MoviesDBHelper dbHelper = MoviesDBHelper();
  return await dbHelper.getMovies();
  }
  Future<Database> _initDB() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, "MoviesDB.db");
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Movies (
        title TEXT,
        original_title TEXT,
        backdrop_path TEXT,
        overview TEXT,
        poster_path TEXT,
        release_date TEXT,
        id INTEGER,
        media_type TEXT
      )
    ''');
  }
  Future<int> insertMovie(MoviesTMDB movie) async {
    final db = await database;
  var existingMovies = await db!.query('Movies', where: 'id = ?', whereArgs: [movie.id]);
  if (existingMovies.isNotEmpty) {
    return -1; 
  }
  return await db.insert('Movies', movie.toJson());
  }

  Future<List<MoviesTMDB>> getMovies() async {
    final db = await database;
    var res = await db!.query('Movies', where: 'media_type = ?', whereArgs: ["movie"]);
    return res.isNotEmpty ? res.map((c) => MoviesTMDB.fromJson(c)).toList() : [];
  }
  Future<List<MoviesTMDB>> getShows() async {
    final db = await database;
    var res = await db!.query('Movies', where: 'media_type = ?', whereArgs: ["tv"]);
    return res.isNotEmpty ? res.map((c) => MoviesTMDB.fromJson(c)).toList() : [];
  }

  Future<int> deleteMovie(int id) async {
    final db = await database;
    return await db!.delete('Movies', where: 'id = ?', whereArgs: [id]);
  }

  Future<dynamic> alterTable(String tableName, String columneName) async {
  var db = await database;
  var count = await db?.execute("ALTER TABLE $tableName ADD "
      "COLUMN $columneName TEXT;");
  return count;
}
}
