import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_star_wars/core/app_text.dart';
import 'package:my_star_wars/shared/models/film_model.dart';
import 'package:my_star_wars/shared/models/person_model.dart';

class ApiCommunication {
  Future<List<PersonModel>> getPeople() async {
    List<PersonModel> peopleResponse = [];
    var response;
    String nextPageLink = AppText.linkAPIPeople;
    do {
      response = await _getPeopleAPI(link: nextPageLink);
      var _jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        peopleResponse += List<PersonModel>.from(
            _jsonResponse['results'].map((e) => PersonModel.fromMap((e))));
      } else {
        return [];
      }
      nextPageLink = _jsonResponse['next'] != null ? _jsonResponse['next'] : '';
    } while (nextPageLink.isNotEmpty);

    return peopleResponse;
  }

  Future<List<FilmModel>> getFilms() async {
    List<FilmModel> films = [];
    var response = await _getFilmsAPI();

    if (response.statusCode == 200) {
      var _jsonResponse = json.decode(response.body);

      films = List<FilmModel>.from(
          _jsonResponse['results'].map((e) => FilmModel.fromMap((e))));
    } else {
      return [];
    }

    return films;
  }

  Future<http.Response> _getPeopleAPI({required String link}) async {
    try {
      var _headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
      var uri = Uri.parse(link);

      return await http
          .get(Uri.parse(uri.toString()), headers: _headers)
          .timeout(Duration(seconds: 20), onTimeout: () {
        return http.Response('Erro timeout', 504);
      });
    } on Exception {
      return http.Response('Erro', 500);
    }
  }

  Future<http.Response> _getFilmsAPI() async {
    try {
      var _headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
      var uri = Uri.parse(AppText.linkAPIFilm);

      return await http
          .get(Uri.parse(uri.toString()), headers: _headers)
          .timeout(Duration(seconds: 20), onTimeout: () {
        return http.Response('Erro timeout', 504);
      });
    } on Exception {
      return http.Response('Erro', 500);
    }
  }
}
