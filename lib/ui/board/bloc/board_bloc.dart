import 'package:bloc/bloc.dart';
import 'package:flutter_2048/domain/make_move.dart';
import 'package:flutter_2048/domain/random_tile_provider.dart';
import 'package:flutter_2048/model/board/board.dart';
import 'package:flutter_2048/model/board/direction.dart';

import '../../score/bloc/score_bloc.dart';
import '../../score/bloc/score_event.dart';
import 'board_event.dart';
import 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final MakeMove boardMove;
  final RandomTileProvider randomTileProvider;
  final ScoreBloc scoreBloc;

  BoardBloc(this.boardMove, this.randomTileProvider, this.scoreBloc);

  @override
  BoardState get initialState => BoardState(Board());

  @override
  Stream<BoardState> mapEventToState(BoardEvent event) async* {
    if (event is SetupBoard) {
      var tempBoard = randomTileProvider.provide(state.board);
      yield BoardState(randomTileProvider.provide(tempBoard));
    }
    if (event is Move) {
      if(boardMove.move(state.board, event.direction) != state.board) {
        var tempBoard = boardMove.move(state.board, event.direction);
        scoreBloc.add(AddToScore(1));
        yield BoardState(randomTileProvider.provide(tempBoard));
      }
    }
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
}
