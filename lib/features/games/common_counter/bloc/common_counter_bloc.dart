import 'package:bloc/bloc.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:meta/meta.dart';

part 'common_counter_event.dart';
part 'common_counter_state.dart';

class CommonCounterBloc extends Bloc<CommonCounterEvent, CommonCounterState> {
  CommonCounterBloc() : super(CommonCounterInitial()) {
    on<InitializeCommonCounterStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);

    // Game screen event handlers
    on<InitializeGameScreen>(_onInitializeGameScreen);
    on<IncreaseScore>(_onIncreaseScore);
    on<DecreaseScore>(_onDecreaseScore);
    on<ResetScores>(_onResetScores);
  }

  void _onInitializeStartScreen(
    InitializeCommonCounterStartScreen event,
    Emitter<CommonCounterState> emit,
  ) {
    emit(CommonCounterStartScreenState(
      players: [],
      selectedMode: "multiplayer",
      isSinglePlayer: false,
    ));
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
      final lowerCaseMode = event.mode.toLowerCase();
      final isSinglePlayer =
          lowerCaseMode.contains("single") || lowerCaseMode == "singleplayer";

      emit(currentState.copyWith(
        selectedMode: event.mode,
        isSinglePlayer: isSinglePlayer,
      ));
    }
  }

  void _onAddPlayer(
    AddPlayer event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      if (event.index >= 0 && event.index < updatedPlayers.length) {
        updatedPlayers.removeAt(event.index);
      }
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  // Game screen event handlers
  void _onInitializeGameScreen(
    InitializeGameScreen event,
    Emitter<CommonCounterState> emit,
  ) {
    emit(CommonCounterGameState(
      players: List.from(event.players),
      isSinglePlayer: event.isSinglePlayer,
    ));
  }

  void _onIncreaseScore(
    IncreaseScore event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        updatedPlayers[event.playerIndex].score += 1;
      }

      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onDecreaseScore(
    DecreaseScore event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        if (updatedPlayers[event.playerIndex].score > 0) {
          updatedPlayers[event.playerIndex].score -= 1;
        }
      }

      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onResetScores(
    ResetScores event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      for (var i = 0; i < updatedPlayers.length; i++) {
        updatedPlayers[i].score = 0;
      }

      emit(currentState.copyWith(players: updatedPlayers));
    }
  }
}
