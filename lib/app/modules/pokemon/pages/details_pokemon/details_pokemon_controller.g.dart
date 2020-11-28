// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_pokemon_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetailsPokemonController = BindInject(
  (i) => DetailsPokemonController(i<String>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsPokemonController on _DetailsPokemonControllerBase, Store {
  final _$pokemonAtom = Atom(name: '_DetailsPokemonControllerBase.pokemon');

  @override
  PokemonModel get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonModel value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  final _$errorMessageAtom =
      Atom(name: '_DetailsPokemonControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$setDetailsPokemonAsyncAction =
      AsyncAction('_DetailsPokemonControllerBase.setDetailsPokemon');

  @override
  Future<void> setDetailsPokemon() {
    return _$setDetailsPokemonAsyncAction.run(() => super.setDetailsPokemon());
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon},
errorMessage: ${errorMessage}
    ''';
  }
}
