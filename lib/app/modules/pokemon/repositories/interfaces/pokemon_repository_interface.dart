import 'package:flutter_modular/flutter_modular.dart';

/// Classe que cria a interface de um repositório de pokemon.
abstract class IPokemonRepository implements Disposable {
  /// Busca lista de pokémons.
  Future fetchPokemons();

  /// Busca os detalhe de um pokémon com base na [url].
  Future fetchPokemonInfo(String url);
}
