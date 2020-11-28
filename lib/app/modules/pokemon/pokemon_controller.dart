import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'models/pokemon_result_model.dart';
import 'repositories/pokemon_repository.dart';

part 'pokemon_controller.g.dart';

/// Classe responsável por controlar a página de listagem de pokémons.
@Injectable()
class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  final _repository = Modular.get<PokemonRepository>();

  _PokemonControllerBase() {
    setPokemon();
  }

  @observable
  ObservableList<PokemonResultModel> pokemon;

  @computed
  bool get isReady => pokemon != null;

  @observable
  String errorMessage;

  @action
  Future<void> setPokemon() async {
    try {
      await _repository
          .fetchPokemons()
          .then((value) => pokemon = value.asObservable());
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
