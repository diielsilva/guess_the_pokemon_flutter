import 'package:flutter/cupertino.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/enums/app_state.dart';

class AppStore {
  final app = ValueNotifier<AppState>(AppState.playing);
}
