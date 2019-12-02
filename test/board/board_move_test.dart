import 'package:flutter_2048/board/board.dart';
import 'package:flutter_2048/board/board_move.dart';
import 'package:flutter_2048/board/direction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BoardMove boardMove = BoardMove();

  group('moving down one element', () {
    test('case 1', () {
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
//      Board.printMe(boardMove.move(board, Direction.DOWN));

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 2', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [2, 0, 0, 0],
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

    test('case 3', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
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

    test('case 4', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
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
  });

  group('moving down two elements', () {
    test('case 1', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 2', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [0, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 3', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 4', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 5', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 6', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [4, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 7', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [0, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 8', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });
  });

  group('moving down three elements', () {
    test('case 1', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [0, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 2', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 3', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 4', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 5', () {
      List<List<int>> grid = [
        [4, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [0, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 6', () {
      List<List<int>> grid = [
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });

    test('case 7', () {
      List<List<int>> grid = [
        [4, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
        [0, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove.move(board, Direction.DOWN).grid, excepted));
    });
  });

  group('moving down four elements', ()
  {
    test('case 1', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);
      Board.printMe(boardMove.move(board, Direction.DOWN));

      assert(compareLists(boardMove
          .move(board, Direction.DOWN)
          .grid, excepted));
    });

    test('case 2', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [8, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove
          .move(board, Direction.DOWN)
          .grid, excepted));
    });

    test('case 3', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [4, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [2, 0, 0, 0],
        [4, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove
          .move(board, Direction.DOWN)
          .grid, excepted));
    });

    test('case 4', () {
      List<List<int>> grid = [
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove
          .move(board, Direction.DOWN)
          .grid, excepted));
    });
  });
}

bool compareLists(List<List<int>> list1, List<List<int>> list2) {
  var equal = true;
//  print('COMPARE');
//  Board.printMe(Board(grid: list1));
//  Board.printMe(Board(grid: list2));
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      print("${list1[i].elementAt(j) != list2[i].elementAt(j)} v ${list1[i].elementAt(j)} ${list2[i].elementAt(j)}");
      if (list1[i].elementAt(j) != list2[i].elementAt(j)) return false;
    }
  }
  return equal;
}