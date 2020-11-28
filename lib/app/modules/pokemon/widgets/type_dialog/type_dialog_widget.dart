import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../models/type_model.dart';

/// Classe responsável por construir um diálogo que exibe
/// uma lista de tipos.
class TypeDialogWidget extends StatelessWidget {
  final List<TypeModel> types;

  const TypeDialogWidget({Key key, this.types}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "TYPES",
        style: Theme.of(context).textTheme.headline5,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: types != null && types.isNotEmpty
            ? types
                .map((e) => Center(
                      child: Text(e.name.toUpperCase()),
                    ))
                .toList()
            : [
                Text("This pokemon does not\nhave a specific type",
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
