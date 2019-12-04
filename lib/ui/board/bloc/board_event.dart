import 'package:equatable/equatable.dart';
import 'package:flutter_2048/model/board/direction.dart';

abstract class BoardEvent extends Equatable {
  BoardEvent([List props = const []]);
}

class SetupBoard extends BoardEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SetupBoard';
}

class Move extends BoardEvent {

  final Direction direction;

  Move(this.direction);

  @override
  List<Object> get props => [direction];

  @override
  String toString() => 'Move {direction: $direction}';
}