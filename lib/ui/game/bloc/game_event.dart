import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {

}

class NoMoreMoves extends GameEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'NoMoreMoves';
  }
}