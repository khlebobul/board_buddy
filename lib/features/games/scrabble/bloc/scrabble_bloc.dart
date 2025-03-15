import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:board_buddy/shared/models/player_model.dart';

part 'scrabble_event.dart';
part 'scrabble_state.dart';

class ScrabbleBloc extends Bloc<ScrabbleEvent, ScrabbleState> {
  ScrabbleBloc() : super(ScrabbleInitial()) {
    on<InitializeScrabbleStartScreen>(_onInitializeScrabbleStartScreen);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
  }

  void _onInitializeScrabbleStartScreen(
    InitializeScrabbleStartScreen event,
    Emitter<ScrabbleState> emit,
  ) {
    emit(ScrabbleStartScreenState(players: []));
  }

  void _onAddPlayer(
    AddPlayer event,
    Emitter<ScrabbleState> emit,
  ) {
    if (state is ScrabbleStartScreenState) {
      final currentState = state as ScrabbleStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<ScrabbleState> emit,
  ) {
    if (state is ScrabbleStartScreenState) {
      final currentState = state as ScrabbleStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      if (event.index >= 0 && event.index < updatedPlayers.length) {
        updatedPlayers.removeAt(event.index);
        emit(currentState.copyWith(players: updatedPlayers));
      }
    }
  }
}
