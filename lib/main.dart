import 'package:flutter/material.dart';
import 'package:flutter_2048/ui/game/bloc/game_bloc.dart';

import 'game_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/score/bloc/score_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
//    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ScoreBloc>(
            create: (context) => ScoreBloc(),
          ),
          BlocProvider<GameBloc>(
            create: (context) => GameBloc(),
          )
        ],
        child: GamePage(),
      ),
    );
  }
}
