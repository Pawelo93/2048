import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {

}

class GameRunning extends GameState {

  @override
  List<Object> get props => [];
}

class GameOver extends GameState {

  @override
  List<Object> get props => [];

  @override
  String toString() => 'GameOver';
}