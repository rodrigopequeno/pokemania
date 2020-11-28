import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'modules/pokemon/pokemon_controller.dart';
import 'modules/pokemon/pokemon_module.dart';
import 'modules/pokemon/repositories/pokemon_repository.dart';
import 'shared/pages/splash_screen/splash_screen_controller.dart';
import 'shared/pages/splash_screen/splash_screen_page.dart';
import 'shared/services/api/api_service.dart';

/// Classe responsável por controlar a injeção de dependência
/// e as rotas iniciais do aplicativo.
class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $ApiService,
        $SplashScreenController,
        $PokemonController,
        $PokemonRepository,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, __) => SplashScreenPage(),
        ),
        ModularRouter('/pokemon', module: PokemonModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
