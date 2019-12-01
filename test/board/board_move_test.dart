import 'package:flutter_2048/board/board.dart';
import 'package:flutter_2048/board/board_move.dart';
import 'package:flutter_2048/board/direction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BoardMove boardMove = BoardMove();

  test('moving down 1', () {
    List<List<int>> grid = [
      [2, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];
    List<List<int>> excepted = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [2, 0, 0, 0],
    ];
    Board board = Board(grid: grid);
    assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
  });
}

bool compareLists(List<List<int>> list1, List<List<int>> list2) {
  var equal = true;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (list1[i].elementAt(j) != list2[i].elementAt(j)) return false;
    }
  }
  return equal;
}
