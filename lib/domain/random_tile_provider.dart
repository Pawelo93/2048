import 'dart:math';

import 'package:flutter_2048/model/board/board.dart';

class RandomTileProvider {

  Random random = Random(99);

  Board provide(Board actualBoard) {
    int x;
    int y;
    do {
      x = random.nextInt(4);
      y = random.nextInt(4);
    } while(!actualBoard.isEmpty(x, y));

    Board newBoard = actualBoard.copy();
    newBoard.put(x, y, 2);
    return newBoard;
  }
}