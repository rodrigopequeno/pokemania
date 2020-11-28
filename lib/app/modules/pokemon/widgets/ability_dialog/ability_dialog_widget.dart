import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../models/ability_model.dart';

/// Classe responsável por construir um diálogo que exibe
/// uma lista de habilidades.
class AbilityDialogWidget extends StatelessWidget {
  final List<AbilityModel> abilities;

  const AbilityDialogWidget({Key key, this.abilities}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "ABILITIES",
        style: Theme.of(context).textTheme.headline5,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: abilities != null && abilities.isNotEmpty
            ? abilities
                .map((e) => Center(
                      child: Text(e.name.toUpperCase()),
                    ))
                .toList()
            : [
                Text("This pokemon has no abilities",
                    textAlign: TextAlign.center)
              ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: Text(
            "Fechar",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
