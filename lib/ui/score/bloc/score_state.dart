import 'package:equatable/equatable.dart';

class ScoreState extends Equatable {
  final int score;

  ScoreState(this.score);

  @override
  List<Object> get props => [score];
}