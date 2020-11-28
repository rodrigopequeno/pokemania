import 'package:flutter_modular/flutter_modular.dart';
import 'pages/details_pokemon/details_pokemon_page.dart';

import 'pokemon_page.dart';

/// Classe responsável por controlar a injeção de dependência
/// e as rotas do modulo pokémon.
class PokemonModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // $PokemonRepository,
        // $PokemonController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PokemonPage()),
        ModularRouter('/details-pokemon/:id',
            child: (_, args) => DetailsPokemonPage(
                  pokemon: args.data,
                  index: int.tryParse(args.params["id"]) ?? 0,
                )),
      ];

  static Inject get to => Inject<PokemonModule>.of();
}
