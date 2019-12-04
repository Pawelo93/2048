import 'package:flutter/material.dart';
import 'package:flutter_2048/model/board/board.dart';
import 'package:flutter_2048/model/board/board_move.dart';
import 'package:flutter_2048/model/board/direction.dart';
import 'package:flutter_2048/mycolor.dart';
import 'package:flutter_2048/ui/board/bloc/board_bloc.dart';
import 'package:flutter_2048/ui/board/bloc/board_event.dart';
import 'package:flutter_2048/ui/board/bloc/board_state.dart';
import 'package:flutter_2048/ui/board/tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardWidget extends StatelessWidget {
  BoardMove boardMove = BoardMove();
  final BoardBloc boardBloc;

  BoardWidget(this.boardBloc);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / 4;
    double gridHeight = gridWidth;
    double height = 30 + (gridHeight * 4) + 10;
    bool isGameOver = false;
    bool isGameWon = false;
    boardBloc.add(SetupBoard());

    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: BlocBuilder<BoardBloc, BoardState>(
                bloc: boardBloc,
                builder: (context, state) {
                  return GridView.count(
                    primary: false,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    crossAxisCount: 4,
                    children: getGrid(state.board, gridWidth, gridHeight),
                  );
                },
              ),
              onVerticalDragEnd: (DragEndDetails details) {
                //primaryVelocity -ve up +ve down
                print('details ${details.primaryVelocity}');
                if (details.primaryVelocity < 0) {
//                  handleGesture(0);
                boardBloc.add(Move(Direction.UP));

                } else if (details.primaryVelocity > 0) {
//                  handleGesture(1);
                  boardBloc.add(Move(Direction.DOWN));
                }
              },
              onHorizontalDragEnd: (details) {
                //-ve right, +ve left
                if (details.primaryVelocity > 0) {
//                  handleGesture(2);
                  boardBloc.add(Move(Direction.RIGHT));
                } else if (details.primaryVelocity < 0) {
//                  handleGesture(3);
                  boardBloc.add(Move(Direction.LEFT));
                }
              },
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
      color: Color(MyColor.gridBackground),
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
        grids.add(Tile(number, width, height, color, size));
      }
    }
    return grids;
  }
}
