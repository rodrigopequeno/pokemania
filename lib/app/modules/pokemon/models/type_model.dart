/// Classe que representa o tipo de um pokémon.
class TypeModel {
  final int slot;
  final String name;
  final String url;
  TypeModel({
    this.slot,
    this.name,
    this.url,
  });

  TypeModel copyWith({
    int slot,
    String name,
    String url,
  }) {
    return TypeModel(
      slot: slot ?? this.slot,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'name': name,
      'url': url,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TypeModel(
      slot: map['slot']?.toInt(),
      name: map['type']['name'],
      url: map['type']['url'],
    );
  }

  @override
  String toString() => 'TypeModel(slot: $slot, name: $name, url: $url)';
}
