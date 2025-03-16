import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:meta/meta.dart';

part 'set_event.dart';
part 'set_state.dart';

class SetBloc extends Bloc<SetEvent, SetState> {
  SetBloc() : super(SetInitial()) {
    on<InitializeSetStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);

    // Game screen event handlers
    on<InitializeGameScreen>(_onInitializeGameScreen);
    on<IncreaseScore>(_onIncreaseScore);
    on<DecreaseScore>(_onDecreaseScore);
    on<ResetScores>(_onResetScores);
    on<UndoAction>(_onUndoAction);
    on<RedoAction>(_onRedoAction);
  }

  void _onInitializeStartScreen(
    InitializeSetStartScreen event,
    Emitter<SetState> emit,
  ) {
    emit(SetStartScreenState(
      players: [],
      selectedMode: S.current.multiplayer,
      isSinglePlayer: false,
    ));
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<SetState> emit,
  ) {
    if (state is SetStartScreenState) {
      final currentState = state as SetStartScreenState;
      final lowerCaseMode = event.mode.toLowerCase();
      final isSinglePlayer =
          lowerCaseMode.contains(S.current.singleplayer) || lowerCaseMode == S.current.singleplayer;

      emit(currentState.copyWith(
        selectedMode: event.mode,
        isSinglePlayer: isSinglePlayer,
      ));
    }
  }

  void _onAddPlayer(
    AddPlayer event,
    Emitter<SetState> emit,
  ) {
    if (state is SetStartScreenState) {
      final currentState = state as SetStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<SetState> emit,
  ) {
    if (state is SetStartScreenState) {
      final currentState = state as SetStartScreenState;
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
    Emitter<SetState> emit,
  ) {
    emit(SetGameState(
      players: List.from(event.players),
      isSinglePlayer: event.isSinglePlayer,
      history: [],
      redoHistory: [],
    ));
  }

  void _onIncreaseScore(
    IncreaseScore event,
    Emitter<SetState> emit,
  ) {
    if (state is SetGameState) {
      final currentState = state as SetGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: updatedPlayers[event.playerIndex].score,
          newScore: updatedPlayers[event.playerIndex].score + 1,
          isIncrease: true,
        );

        updatedPlayers[event.playerIndex].score += 1;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
        ));
      }
    }
  }

  void _onDecreaseScore(
    DecreaseScore event,
    Emitter<SetState> emit,
  ) {
    if (state is SetGameState) {
      final currentState = state as SetGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        if (updatedPlayers[event.playerIndex].score > 0) {
          // Save current state to history before making changes
          final historyItem = ScoreHistoryItem(
            playerIndex: event.playerIndex,
            oldScore: updatedPlayers[event.playerIndex].score,
            newScore: updatedPlayers[event.playerIndex].score - 1,
            isIncrease: false,
          );

          updatedPlayers[event.playerIndex].score -= 1;

          final updatedHistory =
              List<ScoreHistoryItem>.from(currentState.history)
                ..add(historyItem);

          emit(currentState.copyWith(
            players: updatedPlayers,
            history: updatedHistory,
            redoHistory: [], // Clear redo history on new action
          ));
        }
      }
    }
  }

  void _onUndoAction(
    UndoAction event,
    Emitter<SetState> emit,
  ) {
    if (state is SetGameState) {
      final currentState = state as SetGameState;

      if (currentState.history.isNotEmpty) {
        final updatedPlayers = List<Player>.from(currentState.players);
        final historyItem = currentState.history.last;
        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..removeLast();
        final updatedRedoHistory =
            List<ScoreHistoryItem>.from(currentState.redoHistory)
              ..add(historyItem);

        // Revert the score change
        updatedPlayers[historyItem.playerIndex].score = historyItem.oldScore;

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: updatedRedoHistory,
        ));
      }
    }
  }

  void _onRedoAction(
    RedoAction event,
    Emitter<SetState> emit,
  ) {
    if (state is SetGameState) {
      final currentState = state as SetGameState;

      if (currentState.redoHistory.isNotEmpty) {
        final updatedPlayers = List<Player>.from(currentState.players);
        final redoItem = currentState.redoHistory.last;
        final updatedRedoHistory =
            List<ScoreHistoryItem>.from(currentState.redoHistory)..removeLast();
        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(redoItem);

        // Apply the score change
        updatedPlayers[redoItem.playerIndex].score = redoItem.newScore;

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: updatedRedoHistory,
        ));
      }
    }
  }

  void _onResetScores(
    ResetScores event,
    Emitter<SetState> emit,
  ) {
    if (state is SetGameState) {
      final currentState = state as SetGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      for (var i = 0; i < updatedPlayers.length; i++) {
        updatedPlayers[i].score = 0;
      }

      emit(currentState.copyWith(
        players: updatedPlayers,
        history: [], // Clear history on reset
        redoHistory: [], // Clear redo history on reset
      ));
    }
  }
}
