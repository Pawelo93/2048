import 'package:equatable/equatable.dart';

abstract class ScoreEvent extends Equatable {}

class AddToScore extends ScoreEvent {
  final int addScore;

  AddToScore(this.addScore);

  @override
  List<Object> get props => [addScore];
}

class ResetScore extends ScoreEvent {

  ResetScore();

  @override
  List<Object> get props => [];
}