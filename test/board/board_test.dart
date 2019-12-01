import 'package:flutter_2048/board/board.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Board board = Board();

  test('two empty boards are equal', () {
    assert (Board() == Board());
  });

  test('new board is empty', () {
    var list = board.grid.expand((line) => line.map((num) => num == 0)).toList();
    assert (!list.contains(false));
    assert (list.length == 16);
  });
}