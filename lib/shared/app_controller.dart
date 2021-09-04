import 'dart:convert';
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
    if (people.isEmpty) {
      await _getPeople();
    }

    this.films = await db.getFilms();
    if (films.isEmpty) {
      await _getFilms();
    }

    if (state == AppState.loading) {
      state = AppState.sucess;
    }
  }

  Future<void> _getPeople() async {
    try {
      var response = await ApiCommunication().getPeople();

      if (response.statusCode == 200) {
        var _jsonResponse = json.decode(response.body);

        List<PersonModel> peopleResponse = List<PersonModel>.from(
            _jsonResponse['results'].map((e) => PersonModel.fromMap((e))));

        await db.insertPerson(peopleResponse);

        this.people = await db.getPeople();
      } else {
        state = AppState.error;
      }
    } on Exception {
      state = AppState.error;
      print("Erro ao buscar pessoas");
    }
  }

  Future<void> _getFilms() async {
    try {
      var response = await ApiCommunication().getFilms();

      if (response.statusCode == 200) {
        var _jsonResponse = json.decode(response.body);

        List<FilmModel> filmsResponse = List<FilmModel>.from(
            _jsonResponse['results'].map((e) => FilmModel.fromMap((e))));

        await db.insertFilms(filmsResponse);

        this.films = await db.getFilms();
      } else {
        state = AppState.error;
      }
    } on Exception {
      state = AppState.error;
      print("Erro ao buscar filmes");
    }
  }
}
