import 'dart:convert';

class PersonModel {
  int? id;
  final String name;
  late bool isFavorite;

  PersonModel({
    this.id,
    required this.name,
    required this.isFavorite,
  });

  PersonModel copyWith({
    int? id,
    String? name,
    bool? isFavorite,
  }) {
    return PersonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      name: map['name'],
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] != null : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source));
}
