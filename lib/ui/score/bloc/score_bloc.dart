import 'package:bloc/bloc.dart';

import 'score_event.dart';
import 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {

  @override
  ScoreState get initialState => ScoreState(0);

  @override
  Stream<ScoreState> mapEventToState(ScoreEvent event) async* {
    if(event is AddToScore) {
      yield ScoreState(state.score + event.addScore);
    } else if(event is ResetScore) {
      yield ScoreState(0);
    }
  }
}