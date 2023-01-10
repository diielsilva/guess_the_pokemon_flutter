import 'package:flutter/cupertino.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/controllers/form_controller.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/enums/app_state.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/stores/app_store.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/stores/points_store.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/stores/pokemon_store.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/stores/tries_store.dart';
import 'package:guess_the_pokemon/src/shared/data/pokemon_repository.dart';
import 'package:guess_the_pokemon/src/shared/models/pokemon.dart';

class PokemonService {
  final form = FormController();
  final repository = PokemonRepository();
  final appStore = AppStore();
  final triesStore = TriesStore();
  final pointsStore = PointsStore();
  var pokemonIndex = 0;
  late PokemonStore pokemonStore;
  late List<Pokemon> pokemons;

  PokemonService() {
    pokemons = repository.getAllPokemons();
    pokemonStore = PokemonStore(
      pokemon: ValueNotifier(pokemons.elementAt(pokemonIndex)),
    );
  }

  void verifyAnswer() {
    if (form.isValid()) {
      if (triesStore.remainingTries.value > 0) {
        if (isAnswerCorrect()) {
          changePokemonIndex();
          increasePoints();
          changePokemon();
        } else {
          decreaseTries();
          decreasePoints();
          gameOver(triesStore.remainingTries.value);
        }
      }
      form.reset();
    }
  }

  void decreaseTries() {
    triesStore.remainingTries.value--;
  }

  void changePokemonIndex() {
    if (pokemonIndex < pokemons.length - 1) {
      pokemonIndex++;
    } else {
      endGame();
    }
  }

  bool isAnswerCorrect() {
    return form.controller.text.toLowerCase() ==
        pokemonStore.pokemon.value.name.toLowerCase();
  }

  void changePokemon() {
    pokemonStore.pokemon.value = pokemons.elementAt(pokemonIndex);
  }

  void decreasePoints() {
    if (pointsStore.points.value > 0) {
      pointsStore.points.value -= 50;
    }
  }

  void increasePoints() {
    pointsStore.points.value += 100;
  }

  void gameOver(int tries) {
    if (tries == 0) {
      appStore.app.value = AppState.gameOver;
    }
  }

  void endGame() {
    appStore.app.value = AppState.end;
  }

  void playGame() {
    appStore.app.value = AppState.playing;
  }

  void buyTries() {
    if (pointsStore.points.value >= 1000) {
      triesStore.remainingTries.value++;
      pointsStore.points.value -= 1000;
    }
  }

  void reset() {
    pokemonIndex = 0;
    triesStore.remainingTries.value = 3;
    pointsStore.points.value = 0;
    playGame();
    changePokemon();
  }
}
