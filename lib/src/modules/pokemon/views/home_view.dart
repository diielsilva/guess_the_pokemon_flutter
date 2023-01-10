import 'package:flutter/material.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/enums/app_state.dart';
import 'package:guess_the_pokemon/src/modules/pokemon/services/pokemon_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final service = PokemonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,
              padding: const EdgeInsets.all(10),
              child: ValueListenableBuilder<AppState>(
                valueListenable: service.appStore.app,
                builder: ((context, value, child) {
                  switch (value) {
                    case AppState.playing:
                      return Form(
                        key: service.form.key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Quem é esse Pokémon?',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: ValueListenableBuilder(
                                valueListenable: service.pokemonStore.pokemon,
                                builder: (context, value, child) {
                                  return Image.asset(
                                    value.imagePath,
                                    width: 120,
                                  );
                                },
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: TextFormField(
                                controller: service.form.controller,
                                validator: service.form.validate,
                                decoration:
                                    const InputDecoration(labelText: "Nome"),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 40,
                              margin: const EdgeInsets.all(40),
                              child: ElevatedButton(
                                onPressed: service.verifyAnswer,
                                child: const Text('Verificar'),
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable:
                                        service.triesStore.remainingTries,
                                    builder: ((context, value, child) {
                                      return Card(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(children: [
                                            Image.asset(
                                              'assets/images/health.png',
                                              width: 50,
                                            ),
                                            Container(
                                                margin: const EdgeInsets.all(5),
                                                child: Text('$value'))
                                          ]),
                                        ),
                                      );
                                    }),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable: service.pointsStore.points,
                                    builder: ((context, value, child) {
                                      return Card(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(children: [
                                            Image.asset(
                                              'assets/images/points.png',
                                              width: 50,
                                            ),
                                            Container(
                                                margin: const EdgeInsets.all(5),
                                                child: Text('$value'))
                                          ]),
                                        ),
                                      );
                                    }),
                                  ),
                                  GestureDetector(
                                    onTap: service.buyTries,
                                    child: Card(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/images/buy.png',
                                          width: 50,
                                        ),
                                      ),
                                    ),
                                  )
                                ])
                          ],
                        ),
                      );
                    case AppState.end:
                      return Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Parabéns, você é um treinador Pokémon e obeteve um total de ${service.pointsStore.points.value} pontos',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.green),
                              ),
                              Container(
                                width: 200,
                                height: 40,
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: service.reset,
                                  child: const Text('Jogar Novamente'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    case AppState.gameOver:
                      return Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Que pena, você perdeu, mas obeteve um total de ${service.pointsStore.points.value} pontos',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.red),
                              ),
                              Container(
                                width: 200,
                                height: 40,
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: service.reset,
                                  child: const Text('Tentar Novamente'),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                  }
                }),
              )),
        ),
      ),
    );
  }
}
