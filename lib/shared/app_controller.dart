import 'package:flutter/material.dart';
import 'package:my_star_wars/shared/app_state.dart';
import 'package:my_star_wars/shared/data/data_base.dart';
import 'api/api_communication.dart';
import 'models/film_model.dart';
import 'models/person_model.dart';

class AppController {
  final stateNotifier = ValueNotifier<AppState>(AppState.loading);
  set state(AppState state) => stateNotifier.value = state;
  AppState get state => stateNotifier.value;

  DataBase db = new DataBase();
  List<PersonModel> people = [];
  List<FilmModel> films = [];

  Future<void> initAppController() async {
    this.people = await db.getPeople();
    this.films = await db.getFilms();

    if (people.isEmpty || films.isEmpty) {
      await _getSavePeople();
      await _getSaveFilms();
    } else {
      await Future.delayed(Duration(seconds: 3));
    }

    if (state == AppState.loading) {
      state = AppState.sucess;
    }
  }

  Future<void> _getSavePeople() async {
    try {
      people = await ApiCommunication().getPeople();

      if (people.isEmpty) {
        state = AppState.error;
        return;
      }

      await db.insertPerson(people);

      people = await db.getPeople();
    } catch (e) {
      state = AppState.error;
    }
  }

  Future<void> _getSaveFilms() async {
    try {
      films = await ApiCommunication().getFilms();

      if (films.isEmpty) {
        state = AppState.error;
        return;
      }

      await db.insertFilms(films);
    } on Exception {
      state = AppState.error;
    }
  }
}
