import 'ability_model.dart';
import 'statistic_model.dart';
import 'type_model.dart';

/// Classe que representa um pokémon.
class PokemonModel {
  final List<AbilityModel> abilities;
  final double height;
  final int id;
  final String name;
  final int order;
  final List<TypeModel> types;
  final double weight;
  final int baseExperience;
  final String species;
  final String avatar;
  final List<StatisticModel> stats;

  PokemonModel({
    this.abilities,
    this.height,
    this.id,
    this.name,
    this.order,
    this.types,
    this.weight,
    this.baseExperience,
    this.species,
    this.avatar,
    this.stats,
  });

  /// Converte a altura do pokémon de decímetros para metros.
  double get heightToCm => height * 0.1;

  /// Converte o peso do pokémon de hectogramas para quilogramas.
  double get weightToGram => weight * 0.1;

  PokemonModel copyWith({
    List<AbilityModel> abilities,
    int height,
    int id,
    String name,
    int order,
    List<TypeModel> types,
    int weight,
    int baseExperience,
    String species,
    String avatar,
    List<StatisticModel> stats,
  }) {
    return PokemonModel(
      abilities: abilities ?? this.abilities,
      height: height ?? this.height,
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      types: types ?? this.types,
      weight: weight ?? this.weight,
      baseExperience: baseExperience ?? this.baseExperience,
      species: species ?? this.species,
      avatar: avatar ?? this.avatar,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'abilities': abilities?.map((x) => x?.toMap())?.toList(),
      'height': height,
      'id': id,
      'name': name,
      'order': order,
      'types': types?.map((x) => x?.toMap())?.toList(),
      'weight': weight,
      'base_experience': baseExperience,
      'species': species,
      'sprites': avatar,
      'stats': stats?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    var _abilities = <AbilityModel>[];
    var _types = <TypeModel>[];
    var _stats = <StatisticModel>[];
    if (map['abilities'] != null) {
      _abilities = List<AbilityModel>.from(
          map['abilities']?.map((x) => AbilityModel.fromMap(x)));
    }
    if (map['types'] != null) {
      _types =
          List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x)));
    }
    if (map['stats'] != null) {
      _stats = List<StatisticModel>.from(
          map['stats']?.map((x) => StatisticModel.fromMap(x)));
    }
    return PokemonModel(
      abilities: _abilities,
      height: map['height']?.toDouble(),
      id: map['id']?.toInt(),
      name: map['name'],
      order: map['order']?.toInt(),
      types: _types,
      weight: map['weight']?.toDouble(),
      baseExperience: map['base_experience']?.toInt(),
      species: map['species']['name'],
      avatar: map['sprites']['other']['dream_world']['front_default'],
      stats: _stats,
    );
  }

  @override
  String toString() {
    return '''PokemonInfoModel(abilities: $abilities, height: $height, id: $id, name: $name, order: $order, types: $types, weight: $weight, baseExperience: $baseExperience, species: $species, avatar: $avatar, stats: $stats)''';
  }
}
