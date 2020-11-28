// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PokemonController = BindInject(
  (i) => PokemonController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonController on _PokemonControllerBase, Store {
  Computed<bool> _$isReadyComputed;

  @override
  bool get isReady => (_$isReadyComputed ??= Computed<bool>(() => super.isReady,
          name: '_PokemonControllerBase.isReady'))
      .value;

  final _$pokemonAtom = Atom(name: '_PokemonControllerBase.pokemon');

  @override
  ObservableList<PokemonResultModel> get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(ObservableList<PokemonResultModel> value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_PokemonControllerBase.errorMessage');

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

  final _$setPokemonAsyncAction =
      AsyncAction('_PokemonControllerBase.setPokemon');

  @override
  Future<void> setPokemon() {
    return _$setPokemonAsyncAction.run(() => super.setPokemon());
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon},
errorMessage: ${errorMessage},
isReady: ${isReady}
    ''';
  }
}
