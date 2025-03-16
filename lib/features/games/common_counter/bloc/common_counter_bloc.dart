import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
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
    on<IncreaseScoreBy>(_onIncreaseScoreBy);
    on<DecreaseScoreBy>(_onDecreaseScoreBy);
    on<ResetScores>(_onResetScores);
    on<UndoAction>(_onUndoAction);
    on<RedoAction>(_onRedoAction);
    on<ResetScoreAnimation>(_onResetScoreAnimation);
  }

  void _onInitializeStartScreen(
    InitializeCommonCounterStartScreen event,
    Emitter<CommonCounterState> emit,
  ) {
    emit(CommonCounterStartScreenState(
      players: [],
      selectedMode: S.current.multiplayer,
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
          lowerCaseMode.contains(S.current.singleplayer) || lowerCaseMode == S.current.singleplayer;

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
      history: [],
      redoHistory: [],
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
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;
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

  void _onIncreaseScoreBy(
    IncreaseScoreBy event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: updatedPlayers[event.playerIndex].score,
          newScore: updatedPlayers[event.playerIndex].score + event.amount,
          isIncrease: true,
        );

        updatedPlayers[event.playerIndex].score += event.amount;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
          isScoreChanging: true,
          lastScoreChange: event.amount,
        ));
      }
    }
  }

  void _onDecreaseScoreBy(
    DecreaseScoreBy event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        final newScore = updatedPlayers[event.playerIndex].score - event.amount;
        final actualScore = newScore < 0 ? 0 : newScore;
        final actualDecrease =
            updatedPlayers[event.playerIndex].score - actualScore;

        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: updatedPlayers[event.playerIndex].score,
          newScore: actualScore,
          isIncrease: false,
        );

        updatedPlayers[event.playerIndex].score = actualScore;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
          isScoreChanging: true,
          lastScoreChange: -actualDecrease,
        ));
      }
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

      emit(currentState.copyWith(
        players: updatedPlayers,
        history: [], // Clear history on reset
        redoHistory: [], // Clear redo history on reset
      ));
    }
  }

  void _onUndoAction(
    UndoAction event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;

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
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;

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

  void _onResetScoreAnimation(
    ResetScoreAnimation event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;
      emit(currentState.copyWith(
        isScoreChanging: false,
      ));
    }
  }
}
