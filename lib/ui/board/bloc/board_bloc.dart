import 'package:bloc/bloc.dart';
import 'package:flutter_2048/domain/make_move.dart';
import 'package:flutter_2048/domain/random_tile_provider.dart';
import 'package:flutter_2048/model/board/board.dart';
import 'package:flutter_2048/model/board/direction.dart';

import 'board_event.dart';
import 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final MakeMove boardMove;
  final RandomTileProvider randomTileProvider;

  BoardBloc(this.boardMove, this.randomTileProvider);

  @override
  BoardState get initialState => BoardState(Board());

  @override
  Stream<BoardState> mapEventToState(BoardEvent event) async* {
    if (event is SetupBoard) {
      var tempBoard = randomTileProvider.provide(state.board);
      yield BoardState(randomTileProvider.provide(tempBoard));
    }
    if (event is Move) {
      var tempBoard = boardMove.move(state.board, event.direction);
      yield BoardState(randomTileProvider.provide(tempBoard));
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
