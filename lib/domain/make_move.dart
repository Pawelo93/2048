import '../model/board/board.dart';
import '../model/board/direction.dart';

class MakeMove {

  Board move(Board passedBoard, Direction direction) {
    Board actualBoard;
    if (direction == Direction.DOWN) {
      actualBoard = passedBoard.copy();
    } else if (direction == Direction.RIGHT) {
      actualBoard = rotateTableLeft(passedBoard);
      actualBoard = rotateTableLeft(actualBoard);
      actualBoard = rotateTableLeft(actualBoard);
    } else if (direction == Direction.UP) {
      actualBoard = rotateTableLeft(passedBoard);
      actualBoard = rotateTableLeft(actualBoard);
    } else if (direction == Direction.LEFT) {
      actualBoard = rotateTableLeft(passedBoard);
    }

    for (int column = 0; column < 4; column++) {
      _moveDown(actualBoard, column);
      _join(actualBoard, column);
      _moveDown(actualBoard, column);
    }

    Board resultBoard;
    if (direction == Direction.DOWN) {
      resultBoard = actualBoard.copy();
    } else if (direction == Direction.RIGHT) {
      resultBoard = rotateTableLeft(actualBoard);
    } else if (direction == Direction.UP) {
      resultBoard = rotateTableLeft(actualBoard);
      resultBoard = rotateTableLeft(resultBoard);
    } else if (direction == Direction.LEFT) {
      resultBoard = rotateTableLeft(actualBoard);
      resultBoard = rotateTableLeft(resultBoard);
      resultBoard = rotateTableLeft(resultBoard);
    }

    return resultBoard;
  }

  void _moveDown(Board actualBoard, int column) {
    for (int times = 0; times < 3; times++) {
      for (int row = 3; row > 0; row--) {
        if (actualBoard.grid[row].elementAt(column) == 0) {
          actualBoard.put(
              row, column, actualBoard.grid[row - 1].elementAt(column));
          actualBoard.remove(row - 1, column);
        }
      }
    }
  }

  void _join(Board actualBoard, int column) {
    for (int row = 3; row > 0; row--) {
      var value = actualBoard.grid[row].elementAt(column);
      var valueUp = actualBoard.grid[row - 1].elementAt(column);
      if (value == valueUp) {
        actualBoard.put(
            row, column, actualBoard.grid[row - 1].elementAt(column) * 2);
        actualBoard.remove(row - 1, column);
      }
    }
  }

  Board rotateTableLeft(Board board) {
    List<List<int>> newGrid = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        var value = board.grid[i].elementAt(j);

        newGrid[3 - j].replaceRange(i, i+1, [value]);
      }
    }
    return Board(grid: newGrid);
  }
}