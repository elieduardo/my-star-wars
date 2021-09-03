import 'package:http/http.dart' as http;

class ApiCommunication {
  Future<http.Response> getPeople() async {
    try {
      var _headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
      var uri = Uri.parse('https://swapi.dev/api/people/');

      return await http.get(Uri.parse(uri.toString()), headers: _headers);
    } on Exception {
      return http.Response('Erro', 500);
    }
  }

  Future<http.Response> getFilms() async {
    try {
      var _headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
      var uri = Uri.parse('https://swapi.dev/api/films/');

      return await http.get(Uri.parse(uri.toString()), headers: _headers);
    } on Exception {
      return http.Response('Erro', 500);
    }
  }
}
