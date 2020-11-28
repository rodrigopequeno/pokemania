import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../models/pokemon_model.dart';
import '../../repositories/pokemon_repository.dart';

part 'details_pokemon_controller.g.dart';

/// Classe responsável por controlar a pagina de detalhes de um pokémon.
@Injectable()
class DetailsPokemonController = _DetailsPokemonControllerBase
    with _$DetailsPokemonController;

abstract class _DetailsPokemonControllerBase with Store {
  final _repository = Modular.get<PokemonRepository>();
  final String url;

  _DetailsPokemonControllerBase(this.url) {
    setDetailsPokemon();
  }

  @observable
  PokemonModel pokemon;

  @observable
  String errorMessage;

  @action
  Future<void> setDetailsPokemon() async {
    try {
      await _repository.fetchPokemonInfo(url).then((value) => pokemon = value);
      errorMessage = null;
    } on DioError catch (e) {
      errorMessage =
          e.message.contains("SocketException") && e.message.contains("lookup")
              ? "No connection"
              : "An error occurred, please try again later";
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      errorMessage = "An error occurred, please try again later";
    }
  }
}
