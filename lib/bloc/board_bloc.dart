import 'package:bloc/bloc.dart';

import 'board_event.dart';
import 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {

  @override
  // TODO: implement initialState
  BoardState get initialState => throw UnimplementedError();

  @override
  Stream<BoardState> mapEventToState(BoardEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

}