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
    return BlocBuilder<BoardBloc, BoardState>(
      bloc: boardBloc,
      builder: (context, state) {
        if (state is WaitingForMove) {
          var direction = aiEngine.computeDirection(state.board);
          if (direction == Direction.RIGHT)
            boardBloc.moveRight();
          else if (direction == Direction.LEFT)
            boardBloc.moveLeft();
          else if (direction == Direction.UP)
            boardBloc.moveUp();
          else if (direction == Direction.DOWN)
            boardBloc.moveDown();
          else if(direction == null)
            boardBloc.noMoreMoves();
        }
        return BoardGrid(state.board, 20, 20);
      },
    );
  }
}
