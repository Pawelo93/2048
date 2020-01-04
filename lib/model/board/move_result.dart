import 'package:flutter_2048/model/board/board.dart';

class MoveResult {
  final Board board;
  final int score;

  MoveResult(this.board, this.score);
}
