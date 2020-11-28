import 'dart:math';

import 'package:dio/native_imp.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/pokemon_model.dart';
import '../models/pokemon_result_model.dart';
import 'interfaces/pokemon_repository_interface.dart';

part 'pokemon_repository.g.dart';

/// Classe é responsável pela conexão com a API.
///
/// API:
/// https://pokeapi.co/
@Injectable()
class PokemonRepository implements IPokemonRepository {
  final _client = Modular.get<DioForNative>();

  @override
  void dispose() {}

  @override
  Future<List<PokemonResultModel>> fetchPokemons() async {
    var offset = Random().nextInt(1112);
    var limit = 5;
    final response = await _client.get('/pokemon?offset=$offset&limit=$limit',
        options: buildCacheOptions(
          Duration(minutes: 15),
          subKey: "search",
          forceRefresh: true,
        ));
    return (response.data['results'] as List)
        .map((e) => PokemonResultModel.fromMap(e))
        .toList();
  }

  @override
  Future<PokemonModel> fetchPokemonInfo(String urlInfo) async {
    final response = await _client.get(urlInfo,
        options: buildCacheOptions(
          Duration(minutes: 15),
          subKey: "details",
          forceRefresh: true,
        ));
    return PokemonModel.fromMap(response.data);
  }
}
