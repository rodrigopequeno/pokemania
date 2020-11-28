/// Classe que representa uma habilidade de um pokémon.
class AbilityModel {
  /// Identifica o nome da habilidade.
  final String name;

  /// Identifica a url para obter mais informação sobre a habilidade.
  final String url;

  /// Construtor de uma habilidade, que recebe [name] o nome e
  /// [url] da habilidade.
  AbilityModel({
    this.name,
    this.url,
  });

  AbilityModel copyWith({
    String name,
    String url,
  }) {
    return AbilityModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  /// Transforma uma a habilidade em um Map<String, dynamic>
  /// ```
  /// {
  ///  'name': name,
  ///  'url': url,
  /// }
  /// ```
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory AbilityModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AbilityModel(
      name: map['ability']['name'],
      url: map['ability']['url'],
    );
  }

  @override
  String toString() {
    return '''AbilityModel(name: $name, url: $url)''';
  }
}
