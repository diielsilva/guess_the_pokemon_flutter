import 'package:guess_the_pokemon/src/shared/models/pokemon.dart';

class PokemonRepository {
  final basePath = 'assets/images';

  List<Pokemon> getAllPokemons() {
    return [
      Pokemon(name: 'Abra', imagePath: '$basePath/abra.png'),
      Pokemon(name: 'Bellsprout', imagePath: '$basePath/bellsprout.png'),
      Pokemon(name: 'Caterpie', imagePath: '$basePath/caterpie.png'),
      Pokemon(name: 'Charmander', imagePath: '$basePath/charmander.png'),
      Pokemon(name: 'Diglett', imagePath: '$basePath/diglett.png'),
      Pokemon(name: 'Ditto', imagePath: '$basePath/ditto.png'),
      Pokemon(name: 'Dratini', imagePath: '$basePath/dratini.png'),
      Pokemon(name: 'Eevee', imagePath: '$basePath/eevee.png'),
      Pokemon(name: 'Gastly', imagePath: '$basePath/gastly.png'),
      Pokemon(name: 'Gloom', imagePath: '$basePath/gloom.png'),
      Pokemon(name: 'Jigglypuff', imagePath: '$basePath/jigglypuff.png'),
      Pokemon(name: 'Magnemite', imagePath: '$basePath/magnemite.png'),
      Pokemon(name: 'Mankey', imagePath: '$basePath/mankey.png'),
      Pokemon(name: 'Meowth', imagePath: '$basePath/meowth.png'),
      Pokemon(name: 'Mew', imagePath: '$basePath/mew.png'),
      Pokemon(name: 'Oddish', imagePath: '$basePath/oddish.png'),
      Pokemon(name: 'Pidgey', imagePath: '$basePath/pidgey.png'),
      Pokemon(name: 'Pikachu', imagePath: '$basePath/pikachu.png'),
      Pokemon(name: 'Poliwhirl', imagePath: '$basePath/poliwhirl.png'),
      Pokemon(name: 'Psyduck', imagePath: '$basePath/psyduck.png'),
      Pokemon(name: 'Rattata', imagePath: '$basePath/rattata.png'),
      Pokemon(name: 'Sandshrew', imagePath: '$basePath/sandshrew.png'),
      Pokemon(name: 'Snorlax', imagePath: '$basePath/snorlax.png'),
      Pokemon(name: 'Squirtle', imagePath: '$basePath/squirtle.png'),
      Pokemon(name: 'Staryu', imagePath: '$basePath/staryu.png'),
      Pokemon(name: 'Venonat', imagePath: '$basePath/venonat.png'),
      Pokemon(name: 'Voltorb', imagePath: '$basePath/voltorb.png'),
      Pokemon(name: 'Weedle', imagePath: '$basePath/weedle.png'),
      Pokemon(name: 'Zubat', imagePath: '$basePath/zubat.png')
    ];
  }
}
