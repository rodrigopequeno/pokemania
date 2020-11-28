import 'dart:ui';

/// Classe que define as cores das pokebola.
enum PokeBallColor { red, orange, green, blue, purple }

/// Extensão da PokeBallColor
extension PokeBallColorExtension on PokeBallColor {
  /// Retornar um String contendo o nome da cor referente a um pokebola.
  String get name {
    switch (this) {
      case PokeBallColor.red:
        return 'red';
        break;
      case PokeBallColor.orange:
        return 'orange';
        break;
      case PokeBallColor.green:
        return 'green';
        break;
      case PokeBallColor.blue:
        return 'blue';
        break;
      case PokeBallColor.purple:
        return 'purple';
        break;
    }
    return 'red';
  }

  /// Retorna a cor referente a um pokebola.
  Color get color {
    switch (this) {
      case PokeBallColor.red:
        return Color(0xffFF1a1a);
        break;
      case PokeBallColor.orange:
        return Color(0xffFF8000);
        break;
      case PokeBallColor.green:
        return Color(0xff00C250);
        break;
      case PokeBallColor.blue:
        return Color(0xff2979FF);
        break;
      case PokeBallColor.purple:
        return Color(0xffB02191);
        break;
    }
    return Color(0xffffffff);
  }
}
