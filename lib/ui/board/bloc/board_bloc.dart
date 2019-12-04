import 'package:bloc/bloc.dart';
import 'package:flutter_2048/model/board/board.dart';
import 'package:flutter_2048/model/board/board_move.dart';

import 'board_event.dart';
import 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {

  final BoardMove boardMove;

  BoardBloc(this.boardMove);

  @override
  BoardState get initialState => BoardState(Board());

  @override
  Stream<BoardState> mapEventToState(BoardEvent event) async* {
    if(event is SetupBoard) {
      yield BoardState(Board(grid: [
        [0, 0, 0, 0],
        [0, 4, 0, 0],
        [0, 0, 2, 0],
        [0, 0, 0, 0],
      ]));
    }
    if(event is Move) {
      print('EVENT ARRIVED');
      yield BoardState(boardMove.move(state.board, event.direction));
    }
  }

}