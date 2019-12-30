import 'package:flutter/material.dart';
import 'package:flutter_2048/ui/board/bloc/board_bloc.dart';
import 'package:flutter_2048/ui/board/bloc/board_state.dart';
import 'package:flutter_2048/ui/board/board_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RealPlayerWidget extends StatelessWidget {
  final BoardBloc boardBloc;

  const RealPlayerWidget(this.boardBloc);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BlocBuilder<BoardBloc, BoardState>(
        bloc: boardBloc,
        builder: (context, state) {
          return BoardGrid(state.board, 20, 20);
        },
      ),
      onVerticalDragEnd: (DragEndDetails details) {
        //primaryVelocity -ve up +ve down
        if (details.primaryVelocity < 0) {
          boardBloc.moveUp();
        } else if (details.primaryVelocity > 0) {
          boardBloc.moveDown();
        }
      },
      onHorizontalDragEnd: (details) {
        //-ve right, +ve left
        if (details.primaryVelocity > 0) {
          boardBloc.moveRight();
        } else if (details.primaryVelocity < 0) {
          boardBloc.moveLeft();
        }
      },
    );
  }
}