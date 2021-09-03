import 'dart:convert';

class FilmModel {
  final int id;
  final String title;
  late bool isFavorite;
  FilmModel({
    required this.id,
    required this.title,
    required this.isFavorite,
  });

  FilmModel copyWith({
    int? id,
    String? title,
    bool? isFavorite,
  }) {
    return FilmModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory FilmModel.fromMap(Map<String, dynamic> map) {
    return FilmModel(
      id: map['episode_id'],
      title: map['title'],
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmModel.fromJson(String source) =>
      FilmModel.fromMap(json.decode(source));
}
