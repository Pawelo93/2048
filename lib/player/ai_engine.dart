import 'dart:math';

import 'package:flutter_2048/domain/make_move.dart';
import 'package:flutter_2048/model/board/direction.dart';

class AiEngine {

  MakeMove makeMove = MakeMove();

  Stream<Direction> observeMoves() {
    return Stream.periodic(Duration(seconds: 1), (count) => count).map(
          (count) => getRandomDirection(),
    );
  }

  Direction getRandomDirection() {
    Random random = Random(1);
    int nextInt = random.nextInt(4);

    if(nextInt == 0 && makeMove.)

    if(nextInt == 0)
      return Direction.RIGHT;
    else if(nextInt == 1)
      return Direction.LEFT;
    else if(nextInt == 2)
      return Direction.UP;
    else
      return Direction.DOWN;
  }
}