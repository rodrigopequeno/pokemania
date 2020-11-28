import 'dart:convert';

/// Classe que representa um pokémon com apenas o [name] e a [url].
class PokemonResultModel {
  final String name;
  final String url;

  PokemonResultModel({
    this.name,
    this.url,
  });

  PokemonResultModel copyWith({
    String name,
    String url,
  }) {
    return PokemonResultModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonResultModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonResultModel(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonResultModel.fromJson(String source) =>
      PokemonResultModel.fromMap(json.decode(source));

  @override
  String toString() => 'PokemonResultModel(name: $name, url: $url)';
}
