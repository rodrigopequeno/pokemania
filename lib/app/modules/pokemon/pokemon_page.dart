import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/widgets/app_bar/app_bar_widget.dart';
import '../../shared/widgets/button/button_widget.dart';
import 'pokemon_controller.dart';
import 'widgets/pokemon/pokemon_widget.dart';

/// Classe responsável pela construção da tela de listagem de pokémons.
class PokemonPage extends StatefulWidget {
  final String title;
  const PokemonPage({Key key, this.title = "PokéMania"}) : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends ModularState<PokemonPage, PokemonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Observer(
        builder: (_) {
          var pokemons = controller.pokemon;
          if (controller.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.errorMessage,
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    text: "Update",
                    onPressed: () async {
                      await controller.setPokemon();
                    },
                  )
                ],
              ),
            );
          } else if (pokemons == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (pokemons.isEmpty) {
            return Center(
                child: Text(
              "No pokemon found",
              style: TextStyle(fontSize: 20),
            ));
          }

          return RefreshIndicator(
            onRefresh: controller.setPokemon,
            child: ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (_, index) {
                var pokemon = pokemons[index];
                return PokemonWidget(
                  pokemon: pokemon,
                  index: index,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
