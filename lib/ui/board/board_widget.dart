import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_2048/model/board/board.dart';
import 'package:flutter_2048/mycolor.dart';
import 'package:flutter_2048/player/ai_player_widget.dart';
import 'package:flutter_2048/player/real_player_widget.dart';
import 'package:flutter_2048/ui/board/bloc/board_bloc.dart';
import 'package:flutter_2048/ui/board/bloc/board_state.dart';
import 'package:flutter_2048/ui/board/tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardWidget extends StatelessWidget {
  final BoardBloc boardBloc;

  BoardWidget(this.boardBloc);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width - 100;

    double gridWidth = windowWidth / 4;
    double gridHeight = gridWidth;
    double height = gridHeight * 4;
    bool isGameOver = false;
    bool isGameWon = false;
    boardBloc.setupBoard();

    return Container(
      height: height,
      width: height,
      color: Color(MyColor.gridBackground),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RawKeyboardListener(
              autofocus: true,
              focusNode: FocusNode(),
              onKey: keyboardListener,
              child: AiPlayerWidget(boardBloc),
            ),
          ),
          isGameOver
              ? Container(
                  height: height,
                  color: Color(MyColor.transparentWhite),
                  child: Center(
                    child: Text(
                      'Game over!',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color(MyColor.gridBackground)),
                    ),
                  ),
                )
              : SizedBox(),
          isGameWon
              ? Container(
                  height: height,
                  color: Color(MyColor.transparentWhite),
                  child: Center(
                    child: Text(
                      'You Won!',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color(MyColor.gridBackground)),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  void keyboardListener(key) {
    print('key ${key.data}');

    if (key.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      boardBloc.moveUp();
    } else if (key.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      boardBloc.moveDown();
    } else if (key.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      boardBloc.moveLeft();
    } else if (key.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      boardBloc.moveRight();
    }
  }
}

class BoardGrid extends StatelessWidget {
  final Board board;
  final double tileWidth;
  final double tileHeight;

  const BoardGrid(this.board, this.tileWidth, this.tileHeight);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 4,
      children: getGrid(board, tileWidth, tileHeight),
    );
  }

  List<Widget> getGrid(Board board, double width, double height) {
    List<Widget> grids = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        int num = board.grid[i][j];
        String number;
        int color;
        if (num == 0) {
          color = MyColor.emptyGridBackground;
          number = "";
        } else if (num == 2 || num == 4) {
          color = MyColor.gridColorTwoFour;
          number = "${num}";
        } else if (num == 8 || num == 64 || num == 256) {
          color = MyColor.gridColorEightSixtyFourTwoFiftySix;
          number = "${num}";
        } else if (num == 16 || num == 32 || num == 1024) {
          color = MyColor.gridColorSixteenThirtyTwoOneZeroTwoFour;
          number = "${num}";
        } else if (num == 128 || num == 512) {
          color = MyColor.gridColorOneTwentyEightFiveOneTwo;
          number = "${num}";
        } else {
          color = MyColor.gridColorWin;
          number = "${num}";
        }
        double size;
        String n = "${number}";
        switch (n.length) {
          case 1:
          case 2:
            size = 40.0;
            break;
          case 3:
            size = 30.0;
            break;
          case 4:
            size = 20.0;
            break;
        }
        grids.add(TileWidget(number, width, height, color, size));
      }
    }
    return grids;
  }
}
