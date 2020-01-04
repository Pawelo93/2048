import 'dart:io';
import 'dart:math';

import 'package:dart_numerics/dart_numerics.dart' as numerics;
import 'package:flutter_2048/domain/make_move.dart';
import 'package:flutter_2048/model/board/board.dart';
import 'package:flutter_2048/model/board/direction.dart';
import 'package:flutter_2048/model/board/move_result.dart';

enum Player { COMPUTER, USER }

class AiEngine {
  MakeMove makeMove = MakeMove();

  Direction computeDirection(Board board) {
//    Random random = Random(1);
//
//    Direction direction;
//    bool moveNotChoosed = true;
//    var counter = 0;
//
//    while (moveNotChoosed) {
//      int nextInt = random.nextInt(4);
//      if (nextInt == 0)
//        direction = Direction.RIGHT;
//      else if (nextInt == 1)
//        direction = Direction.LEFT;
//      else if (nextInt == 2)
//        direction = Direction.UP;
//      else
//        direction = Direction.DOWN;
//
//      moveNotChoosed = !makeMove.isValidMove(board, direction);
//      counter++;
//
//      if (counter > 10) return null;
//    }

    Map<String, Object> result = minimax(board, 0, 5, Player.USER);
    Direction direction = result["Direction"];
    sleep(Duration(milliseconds: 50));
    print('Result $result');
    return direction;
  }

  Map<String, Object> minimax(Board theBoard, int score, int depth, Player player) {
    Map<String, Object> result = {};
    Direction bestDirection;
    int bestScore;

    if (depth == 0 || theBoard.boardIsFull()) {
      bestScore = heuristicScore(score, theBoard.getNumberOfEmptyCells(), calculateClusteringScore(theBoard));
    } else {
      if (player == Player.USER) {
        bestScore = numerics.int64MinValue;

        for (Direction direction in Direction.values) {
          Board newBoard = theBoard.copy();

          MoveResult moveResult = makeMove.move(newBoard, direction);

          int points = moveResult.score;

          if (points == 0 && moveResult.board == theBoard) {
            continue;
          }

          Map<String, Object> currentResult =
              minimax(moveResult.board, moveResult.score, depth - 1, Player.COMPUTER);
          int currentScore = currentResult["Score"];
          if (currentScore > bestScore) {
            //maximize score
            bestScore = currentScore;
            bestDirection = direction;
          }
        }
      } else {
        bestScore = numerics.int64MaxValue;

        List<int> moves = theBoard.getEmptyCellIds();
        if (moves.isEmpty) {
          bestScore = 0;
        }
        List<int> possibleValues = [2, 4];

        int i, j;
        for (int cellId in moves) {
          i = (cellId / 4).floor();
          j = cellId % 4;

          for (int value in possibleValues) {
            Board newBoard = theBoard.copy();
            newBoard.put(i, j, value);

            Map<String, Object> currentResult =
                minimax(newBoard, score, depth - 1, Player.USER);
            int currentScore = currentResult["Score"];
            if (currentScore < bestScore) {
              //minimize best score
              bestScore = currentScore;
            }
          }
        }
      }
    }

    result["Score"] = bestScore;
    result["Direction"] = bestDirection;

    return result;
  }

  int heuristicScore(int actualScore, int numberOfEmptyCells, int clusteringScore) {
//    print('actualScore $actualScore numberOfEmptyCells $numberOfEmptyCells, clusteringScore $clusteringScore, log ${log(actualScore)}');
    int c;
    if(actualScore > 0)
      c = (log(actualScore) * numberOfEmptyCells).round();
    else
      c = 1;

    int score = (actualScore + c - clusteringScore);
    return max(score, min(actualScore, 1));
  }

  int calculateClusteringScore(Board board) {
    int clusteringScore = 0;

    List<int> neighbors = [-1, 0, 1];

    for (int i = 0; i < board.grid.length; ++i) {
      for (int j = 0; j < board.grid.length; ++j) {
        if (board.grid[i][j] == 0) {
          continue; //ignore empty cells
        }

        //clusteringScore-=boardArray[i][j];

        //for every pixel find the distance from each neightbors
        int numOfNeighbors = 0;
        int sum = 0;
        for (int k in neighbors) {
          int x = i + k;
          if (x < 0 || x >= board.grid.length) {
            continue;
          }
          for (int l in neighbors) {
            int y = j + l;
            if (y < 0 || y >= board.grid.length) {
              continue;
            }

            if (board.grid[x][y] > 0) {
              ++numOfNeighbors;
              sum += (board.grid[i][j] - board.grid[x][y]).abs();
            }
          }
        }

        clusteringScore += (sum / numOfNeighbors).round();
      }
    }

    return clusteringScore;
  }
}
