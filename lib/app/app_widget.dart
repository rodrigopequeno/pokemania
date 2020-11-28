import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/themes/theme_light.dart';

/// Classe responsável por construir o aplicativo e inicia as rotas.
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'PokéMania',
      theme: ThemeLight.getThemeData,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
