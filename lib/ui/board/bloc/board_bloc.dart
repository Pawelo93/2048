import 'package:bloc/bloc.dart';
import 'package:flutter_2048/domain/make_move.dart';
import 'package:flutter_2048/domain/random_tile_provider.dart';
import 'package:flutter_2048/model/board/board.dart';
import 'package:flutter_2048/model/board/direction.dart';
import 'package:flutter_2048/model/board/move_result.dart';
import 'package:flutter_2048/ui/game/bloc/game_bloc.dart';
import 'package:flutter_2048/ui/game/bloc/game_event.dart';
import 'package:flutter_2048/ui/game/bloc/game_state.dart';

import '../../score/bloc/score_bloc.dart';
import '../../score/bloc/score_event.dart';
import 'board_event.dart';
import 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final GameBloc gameBloc;
  final MakeMove boardMove;
  final RandomTileProvider randomTileProvider;
  final ScoreBloc scoreBloc;

  BoardBloc(this.gameBloc, this.boardMove, this.randomTileProvider, this.scoreBloc);

  @override
  BoardState get initialState => BoardMove(Board());

  @override
  Stream<BoardState> mapEventToState(BoardEvent event) async* {
    if(gameBloc.state is! GameRunning)
      return;

    if (event is SetupBoard) {
      var tempBoard = randomTileProvider.provide(state.board);
      yield BoardMove(randomTileProvider.provide(tempBoard));
    }
    if (event is Move) {
      if(boardMove.isValidMove(state.board, event.direction)) {
        MoveResult moveResult = boardMove.move(state.board, event.direction);
        scoreBloc.add(AddToScore(moveResult.score));
        yield BoardMove(randomTileProvider.provide(moveResult.board));
      }
    }
    yield WaitingForMove(state.board);
  }

  void moveUp() {
    add(Move(Direction.UP));
  }

  void moveDown() {
    add(Move(Direction.DOWN));
  }

  void moveLeft() {
    add(Move(Direction.LEFT));
  }

  void moveRight() {
    add(Move(Direction.RIGHT));
  }

  void setupBoard() {
    add(SetupBoard());
  }

  void noMoreMoves() {
    gameBloc.add(NoMoreMoves());
  }
}
