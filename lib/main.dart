import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:memory_game/memory_game_model.dart';

void main() {
  runApp(MemoryGame());
}

class MemoryGame extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Memory Game Controller',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<MemoryGameModel>(
          create: (_) => MemoryGameModel(),
          child: Scaffold(
              appBar: AppBar(
                title: Text('Memory Game'),
              ),
              body: Consumer<MemoryGameModel>(builder: (context, model, child) {
                return SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    child: model.icon(0),
                                    onPressed: () async {
                                      model.open(0);
                                    },
                                  ),
                                  FloatingActionButton(
                                    child: model.icon(1),
                                    onPressed: () async {
                                      model.open(1);
                                    },
                                  ),
                                  FloatingActionButton(
                                    child: model.icon(2),
                                    onPressed: () async {
                                      model.open(2);
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    child: model.icon(3),
                                    onPressed: () async {
                                      model.open(3);
                                    },
                                  ),
                                  FloatingActionButton(
                                    child: model.icon(4),
                                    onPressed: () async {
                                      model.open(4);
                                    },
                                  ),
                                  FloatingActionButton(
                                    child: model.icon(5),
                                    onPressed: () async {
                                      model.open(5);
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    child: model.icon(6),
                                    onPressed: () async {
                                      model.open(6);
                                    },
                                  ),
                                  FloatingActionButton(
                                    child: model.icon(7),
                                    onPressed: () async {
                                      model.open(7);
                                    },
                                  ),
                                  FloatingActionButton(
                                    child: model.icon(8),
                                    onPressed: () async {
                                      model.open(8);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
        ));
  }
}
