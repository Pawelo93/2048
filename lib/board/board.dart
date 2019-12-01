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

  void put(int column, int row, int value) {
    grid[row].insert(column, value);
  }
}
