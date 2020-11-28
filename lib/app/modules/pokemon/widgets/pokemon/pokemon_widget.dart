import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/utils/enum/poke_ball_color.dart';
import '../../../../shared/utils/extension/string.dart';
import '../../models/pokemon_result_model.dart';

/// Classe responsável por representar um pokémon.
class PokemonWidget extends StatelessWidget {
  final PokemonResultModel pokemon;
  final int index;

  const PokemonWidget({Key key, this.pokemon, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: InkWell(
        onTap: () {
          Modular.link.pushNamed('/details-pokemon/$index', arguments: pokemon);
        },
        child: Card(
          color:
              PokeBallColor.values[index % PokeBallColor.values.length].color,
          child: Container(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Flexible(
                    child: Text(
                      '${pokemon.name.toFirstLetterUpperCase()}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Image.asset(
                        'assets/images/pokebola/${PokeBallColor.values[index % PokeBallColor.values.length].name}.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
