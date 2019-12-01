import 'package:equatable/equatable.dart';

class BoardState extends Equatable {
  final board;

  BoardState(this.board);

  @override
  List<Object> get props => [board];

  @override
  String toString() => 'BoardState {$board}';
}