import 'package:flutter_2048/ui/board/bloc/board_state.dart';
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

  group('moving all', ()
  {
    test('case down', () {
      List<List<int>> grid = [
        [2, 4, 4, 0],
        [4, 2, 0, 2],
        [2, 0, 2, 0],
        [0, 0, 2, 2],
      ];
      List<List<int>> excepted = [
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 4, 4, 0],
        [2, 2, 4, 4],
      ];
      Board board = Board(grid: grid);

      assert(compareLists(boardMove
          .move(board, Direction.DOWN)
          .grid, excepted));
    });

    test('case right', () {
      List<List<int>> grid = [
        [2, 4, 4, 0],
        [2, 2, 0, 2],
        [2, 0, 2, 0],
        [0, 0, 2, 2],
      ];
      List<List<int>> excepted = [
        [0, 0, 2, 8],
        [0, 0, 2, 4],
        [0, 0, 0, 4],
        [0, 0, 0, 4],
      ];
      Board board = Board(grid: grid);

      Board.printMe(boardMove.move(Board(grid: [
        [2, 4, 4, 0],
        [2, 2, 0, 2],
        [2, 0, 2, 0],
        [0, 0, 2, 2],
      ]), Direction.RIGHT));

      assert(compareLists(boardMove
          .move(board, Direction.RIGHT)
          .grid, excepted));
    });

    test('case up', () {
      List<List<int>> grid = [
        [2, 4, 0, 0],
        [0, 2, 0, 2],
        [2, 0, 2, 2],
        [0, 2, 2, 2],
      ];
      List<List<int>> excepted = [
        [4, 4, 4, 4],
        [0, 4, 0, 2],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
      ];
      Board board = Board(grid: grid);

      Board.printMe(boardMove.move(Board(grid: [
        [2, 4, 0, 0],
        [0, 2, 0, 2],
        [2, 0, 2, 2],
        [0, 2, 2, 2],
      ]), Direction.UP));

      assert(compareLists(boardMove
          .move(board, Direction.UP)
          .grid, excepted));
    });
  });

  group('rotate table works', ()
  {
    test('case 1', () {
      List<List<int>> grid = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
        [13, 14, 15, 16],
      ];
      List<List<int>> excepted = [
        [4, 8, 12, 16],
        [3, 7, 11, 15],
        [2, 6, 10, 14],
        [1, 5, 9, 13],
      ];
      Board board = Board(grid: grid);

      Board.printMe(boardMove.rotateTableLeft(Board(grid: [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
        [13, 14, 15, 16],
      ])));

      assert(compareLists(boardMove
          .rotateTableLeft(board)
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