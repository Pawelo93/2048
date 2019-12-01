import 'board.dart';
import 'direction.dart';

class BoardMove {


  Board move(Board passedBoard, Direction direction)
  {
//    ArrayList<Moves> moves = new ArrayList<Moves>();
    // points for this move //
//    int points = 0;
//    beforeTableArray = getTableArray();

    Board actualBoard;
    if(direction == Direction.DOWN) {
      actualBoard = passedBoard;
    } else if(direction == Direction.RIGHT) {
      actualBoard = _rotateTableRight(passedBoard);
    } else if(direction == Direction.UP){
      actualBoard = _rotateTableRight(passedBoard);
      actualBoard = _rotateTableRight(passedBoard);
    }else if(direction == Direction.LEFT){
      actualBoard = _rotateTableRight(passedBoard);
      actualBoard = _rotateTableRight(passedBoard);
      actualBoard = _rotateTableRight(passedBoard);
    }

    for(int col = 0; col < 4; col++) {
      var row = 3;
      var value = actualBoard.grid[row - 1].elementAt(col);
      if(actualBoard.grid[row].elementAt(col) == 0)
        actualBoard.put(col, row, value);
      else if(actualBoard.grid[row].elementAt(col) == value)
        actualBoard.put(col, row, value * value);



      row = 2;
      var v1 = actualBoard.grid[row - 2].elementAt(col);
      if(actualBoard.grid[row + 1].elementAt(col) == 0)
        actualBoard.put(col, row + 1, value);
      _replace(actualBoard, row, col, v1);

      row = 1;
      var v0 = actualBoard.grid[row - 1].elementAt(col);
      _replace(actualBoard, row, col, v0);
    }

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
    if(direction == Direction.DOWN) {
      resultBoard = passedBoard;
    } else if(direction == Direction.RIGHT) {
      resultBoard = _rotateTableRight(passedBoard);
      resultBoard = _rotateTableRight(passedBoard);
      resultBoard = _rotateTableRight(passedBoard);
    } else if(direction == Direction.UP){
      resultBoard = _rotateTableRight(passedBoard);
      resultBoard = _rotateTableRight(passedBoard);
    }else if(direction == Direction.LEFT){
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

  void _replace(Board actualBoard, int row, int col, int value) {
    if(actualBoard.grid[row].elementAt(col) == 0)
      actualBoard.put(col, row, value);
    else if(actualBoard.grid[row].elementAt(col) == value)
      actualBoard.put(col, row, value * value);
  }

  Board _rotateTableRight(Board board) {
    return board;
  }
}