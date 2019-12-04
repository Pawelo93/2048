import 'package:equatable/equatable.dart';

class Board extends Equatable {
  List<List<int>> grid;
  static const List<List<int>> empty = [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
  ];

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
//
//  void replace(int row, int column, int value) {
//    put(row, column, value);
//    remove(row, column);
//  }

  static printMe(Board board) {
    print("${board.grid[0]}");
    print("${board.grid[1]}");
    print("${board.grid[2]}");
    print("${board.grid[3]}");
  }
}