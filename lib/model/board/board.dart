import 'package:equatable/equatable.dart';

class Board extends Equatable {
  List<List<int>> grid;
  static const List<List<int>> empty = [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
  ];

//  int score = 0;

  Board({this.grid = empty});

  @override
  List<Object> get props => [grid];

  @override
  String toString() => 'Board $grid';

  void put(int row, int column, int value) {
    grid[row].replaceRange(column, column + 1, [value]);
  }

  void remove(int row, int column) {
    put(row, column, 0);
  }

  static printMe(Board board) {
    print("${board.grid[0]}");
    print("${board.grid[1]}");
    print("${board.grid[2]}");
    print("${board.grid[3]}");
//    print('Score: ${board.score}');
  }

  bool isEmpty(x, y) {
    return grid[x].elementAt(y) == 0;
  }

  bool boardIsFull() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if(grid[i][j] == 0)
          return false;
      }
    }

    return true;
  }

  Board copy() {
    List<List<int>> newGrid = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        var value = grid[i].elementAt(j);
        newGrid[i].replaceRange(j, j + 1, [value]);
      }
    }
    return Board(grid: newGrid);
  }

//  void addScore(int score) {
//    this.score = score;
//  }

  int getNumberOfEmptyCells() {
    int emptyCells = 0;
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if(grid[i][j] == 0)
          emptyCells++;
      }
    }
    return emptyCells;
  }

  List<int> getEmptyCellIds() {
    List<int> cellList = [];

    for(int i=0;i<4;++i) {
      for(int j=0;j<4;++j) {
        if(grid[i][j]==0) {
          cellList.add(4*i+j);
        }
      }
    }

    return cellList;
  }
}
