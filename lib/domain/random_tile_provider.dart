import 'dart:math';

import 'package:flutter_2048/model/board/board.dart';

class RandomTileProvider {

  Random random = Random(1);

  Board provide(Board actualBoard) {
    int x;
    int y;
    do {
      x = random.nextInt(4);
      y = random.nextInt(4);
    } while(!actualBoard.isEmpty(x, y));

    int valueProbability = random.nextInt(10);
    int value;

    if(valueProbability == 0)
      value = 4;
    else
      value = 2;

    Board newBoard = actualBoard.copy();
    newBoard.put(x, y, value);
    return newBoard;
  }
}