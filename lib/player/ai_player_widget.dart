import 'package:flutter/material.dart';
import 'package:flutter_2048/model/board/direction.dart';
import 'package:flutter_2048/player/ai_engine.dart';
import 'package:flutter_2048/ui/board/bloc/board_bloc.dart';
import 'package:flutter_2048/ui/board/bloc/board_state.dart';
import 'package:flutter_2048/ui/board/board_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiPlayerWidget extends StatelessWidget {
  final BoardBloc boardBloc;
  final AiEngine aiEngine = AiEngine();

  AiPlayerWidget(this.boardBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Direction>(
      stream: aiEngine.observeMoves(),
      builder: (context, AsyncSnapshot<Direction> data) {
        if (data.hasData) {
          if (data.data == Direction.RIGHT)
            boardBloc.moveRight();
          else if (data.data == Direction.LEFT)
            boardBloc.moveLeft();
          else if (data.data == Direction.UP)
            boardBloc.moveUp();
          else if (data.data == Direction.DOWN) boardBloc.moveDown();
        }
        return BlocBuilder<BoardBloc, BoardState>(
          bloc: boardBloc,
          builder: (context, state) {
            return BoardGrid(state.board, 20, 20);
          },
        );
      },
    );
  }
}
