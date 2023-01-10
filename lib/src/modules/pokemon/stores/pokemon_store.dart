import 'package:flutter/material.dart';
import 'package:guess_the_pokemon/src/shared/models/pokemon.dart';

class PokemonStore {
  final ValueNotifier<Pokemon> pokemon;

  PokemonStore({required this.pokemon});
}
