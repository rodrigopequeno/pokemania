/// Classe que representa as estatísticas do pokémon.
class StatisticModel {
  final int baseStat;
  final int effort;
  final String name;
  final String url;
  StatisticModel({
    this.baseStat,
    this.effort,
    this.name,
    this.url,
  });

  StatisticModel copyWith({
    int baseStat,
    int effort,
    String name,
    String url,
  }) {
    return StatisticModel(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'effort': effort,
      'name': name,
      'url': url,
    };
  }

  factory StatisticModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return StatisticModel(
      baseStat: map['base_stat']?.toInt(),
      effort: map['effort']?.toInt(),
      name: map['stat']['name'],
      url: map['stat']['url'],
    );
  }

  @override
  String toString() {
    return '''StatisticModel(baseStat: $baseStat, effort: $effort, name: $name, url: $url)''';
  }
}
