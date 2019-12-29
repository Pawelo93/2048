import 'package:equatable/equatable.dart';

import '../../../model/board/board.dart';

class BoardState extends Equatable {
  final Board board;

  BoardState(this.board);

  @override
  List<Object> get props => [board];

  @override
  String toString() => 'BoardState {$board}';
}