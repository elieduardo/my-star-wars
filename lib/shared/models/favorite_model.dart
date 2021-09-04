import 'dart:convert';

class FavoriteModel {
  final String name;
  final bool isPerson;
  FavoriteModel({
    required this.name,
    required this.isPerson,
  });

  FavoriteModel copyWith({
    String? name,
    bool? isPerson,
  }) {
    return FavoriteModel(
      name: name ?? this.name,
      isPerson: isPerson ?? this.isPerson,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isPerson': isPerson,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      name: map['name'],
      isPerson: map['isPerson'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source));

  @override
  String toString() => 'FavoriteModel(name: $name, isPerson: $isPerson)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FavoriteModel &&
        other.name == name &&
        other.isPerson == isPerson;
  }

  @override
  int get hashCode => name.hashCode ^ isPerson.hashCode;
}
