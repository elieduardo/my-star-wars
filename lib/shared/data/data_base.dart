import 'package:my_star_wars/shared/models/film_model.dart';
import 'package:my_star_wars/shared/models/person_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase {
  Database? db;

  Future<void> _openDatabase() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'my_star_wars_database.db'),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE person(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT,  isFavorite INTEGER)",
        );
        db.execute(
          "CREATE TABLE film(id INTEGER PRIMARY KEY, title TEXT, isFavorite INTEGER)",
        );
        return;
      },
      version: 1,
    );
  }

  //inserts
  Future<void> insertPerson(List<PersonModel> personList) async {
    if (db == null) {
      await _openDatabase();
    }

    for (var person in personList) {
      await db!.insert('person', person.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<void> insertFilms(List<FilmModel> films) async {
    if (db == null) {
      await _openDatabase();
    }

    for (var film in films) {
      await db!.insert('film', film.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  //selects
  Future<List<PersonModel>> getPeople() async {
    if (db == null) {
      await _openDatabase();
    }

    final List<Map<String, dynamic>>? maps = await db!.query('person');

    return List.generate(
      maps!.length,
      (index) => (PersonModel(
          id: maps[index]['id'],
          name: maps[index]['name'],
          isFavorite: maps[index]['isFavorite'] == 0 ? false : true)),
    );
  }

  Future<List<FilmModel>> getFilms() async {
    if (db == null) {
      await _openDatabase();
    }

    final List<Map<String, dynamic>>? maps = await db!.query('film');

    return List.generate(
      maps!.length,
      (index) => (FilmModel(
          id: maps[index]['id'],
          title: maps[index]['title'],
          isFavorite: maps[index]['isFavorite'] == 0 ? false : true)),
    );
  }

  //updates
  Future<void> updateFavoriteFilm(FilmModel film) async {
    if (db == null) {
      await _openDatabase();
    }

    film.isFavorite = !film.isFavorite;

    await db!.update('film', film.toMap(), where: "id=?", whereArgs: [film.id]);
  }

  Future<void> updateFavoritePerson(PersonModel person) async {
    if (db == null) {
      await _openDatabase();
    }

    person.isFavorite = !person.isFavorite;

    await db!.update('person', person.toMap(),
        where: "id=?", whereArgs: [person.id]);
  }
}
