import 'package:equatable/equatable.dart';

import '../../../model/board/board.dart';

abstract class BoardState extends Equatable {
  final Board board;

  BoardState(this.board);

  @override
  List<Object> get props => [board];
}

class BoardMove extends BoardState {

  BoardMove(Board board) : super(board);

  @override
  String toString() => 'BoardMove {$board}';
}

class WaitingForMove extends BoardState {

  WaitingForMove(Board board) : super(board);

  @override
  String toString() => 'WaitingForMove {$board}';
}