import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'start_game_event.dart';
part 'start_game_state.dart';

class StartGameBloc extends Bloc<StartGameEvent, StartGameState> {
  StartGameBloc() : super(StartGameInitial()) {
    on<StartGameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
