import 'package:flutter_2048/ui/game/bloc/game_event.dart';
import 'package:flutter_2048/ui/game/bloc/game_state.dart';
import 'package:bloc/bloc.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  @override
  GameState get initialState => GameRunning();

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    print('Event is $event');
    if(event is NoMoreMoves)
      yield GameOver();
  }



}