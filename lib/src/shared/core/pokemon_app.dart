import 'package:flutter/material.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/views/home_view.dart';

class PokemonApp extends StatefulWidget {
  const PokemonApp({super.key});

  @override
  State<PokemonApp> createState() => _PokemonAppState();
}

class _PokemonAppState extends State<PokemonApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
