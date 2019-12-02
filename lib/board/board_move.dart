import 'board.dart';
import 'direction.dart';

class BoardMove {
  Board move(Board passedBoard, Direction direction) {

    Board actualBoard;
    if (direction == Direction.DOWN) {
      actualBoard = passedBoard;
    } else if (direction == Direction.RIGHT) {
      actualBoard = _rotateTableRight(passedBoard);
    } else if (direction == Direction.UP) {
      actualBoard = _rotateTableRight(passedBoard);
      actualBoard = _rotateTableRight(passedBoard);
    } else if (direction == Direction.LEFT) {
      actualBoard = _rotateTableRight(passedBoard);
      actualBoard = _rotateTableRight(passedBoard);
      actualBoard = _rotateTableRight(passedBoard);
    }


//    var col = 0;
//    var row = 3;
//    var fromCol = 0;
//    var fromRow = row - 1;
//    bool merged = false;
//    var value = actualBoard.grid[fromRow].elementAt(fromCol);
//    merged = _checkLowestPosition(actualBoard, col, row, value, fromCol, fromRow, merged);
//
//    row = 2;
//    fromRow = row - 1;
//    value = actualBoard.grid[fromRow].elementAt(fromCol);
//    if(actualBoard.grid[2].elementAt(col) == 0)
//      merged = _checkLowestPosition(actualBoard, col, row + 1, value, fromCol, fromRow, merged);
//    value = actualBoard.grid[fromRow].elementAt(fromCol);
//    merged = _checkPositionTwo(actualBoard, col, row, value, fromCol, fromRow, merged);
//
//    row = 1;
//    fromRow = row - 1;
//    value = actualBoard.grid[fromRow].elementAt(fromCol);
//    if(actualBoard.grid[2].elementAt(col) == 0 && actualBoard.grid[1].elementAt(col) == 0)
//      merged = _checkLowestPosition(actualBoard, col, row + 2, value, fromCol, fromRow, merged);
//    value = actualBoard.grid[fromRow].elementAt(fromCol);
//    if(actualBoard.grid[1].elementAt(col) == 0)
//      merged = _checkPositionTwo(actualBoard, col, row + 1, value, fromCol, fromRow, merged);
//    value = actualBoard.grid[fromRow].elementAt(fromCol);
//    merged = _checkPositionOne(actualBoard, col, row, value, fromCol, fromRow, merged);


//    }

//    for (int i = 0; i < 4; i++) {
//      for (int j = 0; j < 4; j++) {
//
//      }
//    }

//    for(int col=0;col<4;col++)
//      for(int row=1;row<4;row++)
//      {
//        int operacje = 0;
//        for(int c=0;c<row;c++)
//        {
//          if(tableArray[col][row-1-c]==Tile.EMPTY){
//            tableArray[col][row-1-c]=tableArray[col][row-c];
//            if(tableArray[col][row-c] != Tile.EMPTY){
//              moves.add(new Moves(direction, col, row-c, col, row-1-c));
//              tableArray[col][row-c]=Tile.EMPTY;
//            }
//            operacje++;
//          }
//          if(operacje <row && tableArray[col][row-1-operacje]==tableArray[col][row-operacje]){
//            tableArray[col][row-1-operacje]=tableArray[col][row-operacje]*2;
//            points+=tableArray[col][row-operacje]*2;
//            if(tableArray[col][row-1-operacje]!=0)
//              tableArray[col][row-1-operacje]+=1;
//
//            if(tableArray[col][row-operacje] != Tile.EMPTY){
//              moves.add(new Moves(direction, col, row-operacje, col, row-1-operacje));
//              tableArray[col][row-operacje]=Tile.EMPTY;
//            }
//          }
//        }
//      }

//    for(int i=0;i<4;i++)
//    {
//      for(int j=0;j<4;j++)
//      {
//        if(tableArray[i][j]%2!=0)
//        {
//          tableArray[i][j]-=1;
//        }
//      }
//    }

    Board resultBoard;
    if (direction == Direction.DOWN) {
      resultBoard = passedBoard;
    } else if (direction == Direction.RIGHT) {
      resultBoard = _rotateTableRight(passedBoard);
      resultBoard = _rotateTableRight(passedBoard);
      resultBoard = _rotateTableRight(passedBoard);
    } else if (direction == Direction.UP) {
      resultBoard = _rotateTableRight(passedBoard);
      resultBoard = _rotateTableRight(passedBoard);
    } else if (direction == Direction.LEFT) {
      resultBoard = _rotateTableRight(passedBoard);
    }

//    if(direction == Direction.right){
//      rotateTableRight();
//      rotateTableRight();
//      rotateTableRight();
//    }else if(direction == Direction.up){
//      rotateTableRight();
//      rotateTableRight();
//    }else if(direction == Direction.left){
//      rotateTableRight();
//    }

    return resultBoard;
  }

  bool _checkLowestPosition(Board actualBoard, int col, int row, int value,
      int fromCol, int fromRow, bool merged) {
    if (value != 0) {
      if (actualBoard.grid[3].elementAt(col) == 0) {
        actualBoard.put(col, row, value);
        actualBoard.remove(fromCol, fromRow);
      } else if (!merged && actualBoard.grid[3].elementAt(col) == value) {
        actualBoard.put(col, row, value * value);
        actualBoard.remove(fromCol, fromRow);
        return true;
      }
    }
    return merged;
  }

  bool _checkPositionTwo(Board actualBoard, int col, int row, int value,
      int fromCol, int fromRow, bool merged) {
    if (value != 0) {
      if (actualBoard.grid[2].elementAt(col) == 0) {
        actualBoard.put(col, row, value);
        actualBoard.remove(fromCol, fromRow);
      } else if (!merged && actualBoard.grid[2].elementAt(col) == value) {
        actualBoard.put(col, row, value * value);
        actualBoard.remove(fromCol, fromRow);
        return true;
      }
    }
    return merged;
  }

  bool _checkPositionOne(Board actualBoard, int col, int row, int value,
      int fromCol, int fromRow, bool merged) {
    if (value != 0) {
      if (actualBoard.grid[1].elementAt(col) == 0) {
        actualBoard.put(col, row, value);
        actualBoard.remove(fromCol, fromRow);
      } else if (!merged && actualBoard.grid[1].elementAt(col) == value) {
        actualBoard.put(col, row, value * value);
        actualBoard.remove(fromCol, fromRow);
        return true;
      }
    }
    return merged;
  }

  Board _rotateTableRight(Board board) {
    return board;
  }
}
