import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/utils/enum/poke_ball_color.dart';
import '../../../../shared/utils/extension/string.dart';
import '../../../../shared/widgets/app_bar/app_bar_widget.dart';
import '../../../../shared/widgets/avatar/avatar_widget.dart';
import '../../../../shared/widgets/background/background_widget.dart';
import '../../../../shared/widgets/button/button_widget.dart';
import '../../models/pokemon_model.dart';
import '../../models/pokemon_result_model.dart';
import '../../widgets/ability_dialog/ability_dialog_widget.dart';
import '../../widgets/type_dialog/type_dialog_widget.dart';
import 'details_pokemon_controller.dart';

/// Classe responsável pela construção da tela de detalhes de um pokémon.
class DetailsPokemonPage extends StatefulWidget {
  final String title;
  final PokemonResultModel pokemon;
  final int index;

  const DetailsPokemonPage(
      {Key key,
      this.title = "DetailsPokemon",
      @required this.pokemon,
      @required this.index})
      : super(key: key);

  @override
  _DetailsPokemonPageState createState() => _DetailsPokemonPageState();
}

class _DetailsPokemonPageState extends State<DetailsPokemonPage> {
  //use 'controller' variable to access controller
  DetailsPokemonController controller;
  @override
  void initState() {
    controller = DetailsPokemonController(widget.pokemon.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(
          radius: 0,
          elevation: 0,
          color: PokeBallColor
              .values[widget.index % PokeBallColor.values.length].color,
        ),
        body: Observer(builder: (_) {
          var pokemon = controller.pokemon;
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
                      await controller.setDetailsPokemon();
                    },
                  )
                ],
              ),
            );
          } else if (pokemon == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _header(),
                _informationBasic(pokemon),
                _statistic(pokemon),
                SizedBox(
                  height: 30,
                ),
                _actionsButtons(),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: PokeBallColor
              .values[widget.index % PokeBallColor.values.length].color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Observer(builder: (_) {
                  return AvatarWidget(
                    width: 90,
                    image: controller.pokemon?.avatar,
                    imageDefault: PokeBallColor
                        .values[widget.index % PokeBallColor.values.length]
                        .name,
                  );
                }),
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                flex: 3,
                child: Observer(builder: (_) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.pokemon?.id != null
                          ? Text(
                              "#${controller.pokemon.id}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.grey[300]),
                            )
                          : Container(),
                      Flexible(
                        child: Text(
                          """${widget.pokemon.name.toFirstLetterUpperCase()}""",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionsButtons() {
    return Observer(builder: (_) {
      return Visibility(
        visible: controller.pokemon != null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
              onPressed: () async {
                await _showDialog(AbilityDialogWidget(
                  abilities: controller.pokemon.abilities,
                ));
              },
              text: controller.pokemon.abilities == null &&
                      controller.pokemon.abilities.isEmpty
                  ? "NO ABILITIES"
                  : "ABILITIES",
            ),
            ButtonWidget(
              onPressed: () async {
                await _showDialog(TypeDialogWidget(
                  types: controller.pokemon.types,
                ));
              },
              text: "TYPES",
            ),
          ],
        ),
      );
    });
  }

  Future _showDialog(Widget child) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      child: child,
    );
  }

  Widget _informationBasic(PokemonModel pokemon) {
    var _textStyle =
        Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16);
    return Card(
      color: Theme.of(context).cardColor.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Information",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      """Species: ${pokemon.species.toFirstLetterUpperCase()}""",
                      style: _textStyle,
                    ),
                    Text(
                      """Height: ${pokemon.heightToCm.toStringAsFixed(2)}m""",
                      style: _textStyle,
                    ),
                    Text(
                      """Weight: ${pokemon.weightToGram.toStringAsFixed(2)}kg""",
                      style: _textStyle,
                    ),
                    Text(
                      """Base experience: ${pokemon.baseExperience} """,
                      style: _textStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _statistic(PokemonModel pokemon) {
    var stats = pokemon.stats;
    return Card(
      color: Theme.of(context).cardColor.withOpacity(0.7),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text("Base Stats",
                style: Theme.of(context).textTheme.headline6),
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(width: 1, color: Colors.black),
                    children: stats
                        .map((e) => TableRow(children: [
                              Center(child: Text(e.name.toUpperCase())),
                              Center(child: Text(e.baseStat.toString())),
                            ]))
                        .toList()
                          ..insert(
                            0,
                            TableRow(children: [
                              Center(child: Text("STATS")),
                              Center(child: Text("BASE VALUE")),
                            ]),
                          ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
