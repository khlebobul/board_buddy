import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:board_buddy/shared/models/player_model.dart';

part 'carcassonne_event.dart';
part 'carcassonne_state.dart';

class CarcassonneBloc extends Bloc<CarcassonneEvent, CarcassonneState> {
  CarcassonneBloc() : super(CarcassonneInitial()) {
    on<InitializeCarcassonneStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
    on<InitializeGameScreen>(_onInitializeGameScreen);
    on<IncreaseScore>(_onIncreaseScore);
    on<DecreaseScore>(_onDecreaseScore);
    on<UndoAction>(_onUndo);
    on<RedoAction>(_onRedo);
    on<ResetScores>(_onResetScores);
  }

  void _onInitializeStartScreen(
    InitializeCarcassonneStartScreen event,
    Emitter<CarcassonneState> emit,
  ) {
    emit(CarcassonneStartScreenState(
      selectedMode: 'manual',
      isAutomatic: false,
      players: [],
    ));
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      final isAutomatic = event.mode == 'automatic';

      emit(currentState.copyWith(
        selectedMode: event.mode,
        isAutomatic: isAutomatic,
        players: isAutomatic ? [] : currentState.players,
      ));
    }
  }

  void _onAddPlayer(
    AddPlayer event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      if (!currentState.isAutomatic) {
        final players = List<Player>.from(currentState.players);
        players.add(event.player);
        emit(currentState.copyWith(players: players));
      }
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      if (!currentState.isAutomatic) {
        final players = List<Player>.from(currentState.players);
        players.removeAt(event.index);
        emit(currentState.copyWith(players: players));
      }
    }
  }

  void _onInitializeGameScreen(
    InitializeGameScreen event,
    Emitter<CarcassonneState> emit,
  ) {
    emit(CarcassonneGameState(
      isAutomatic: event.isAutomatic,
      players: event.players,
    ));
  }

  void _onIncreaseScore(
    IncreaseScore event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneGameState) {
      final currentState = state as CarcassonneGameState;
      final players = List<Player>.from(currentState.players);
      final playerIndex = event.playerIndex;

      if (playerIndex < players.length) {
        final oldScore = players[playerIndex].score;
        final newScore = oldScore + 1;

        players[playerIndex] = players[playerIndex].copyWith(score: newScore);

        final history = List<ScoreHistoryItem>.from(currentState.history);
        history.add(ScoreHistoryItem(
          playerIndex: playerIndex,
          oldScore: oldScore,
          newScore: newScore,
          isIncrease: true,
        ));

        emit(currentState.copyWith(
          players: players,
          history: history,
          redoHistory: const [],
        ));
      }
    }
  }

  void _onDecreaseScore(
    DecreaseScore event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneGameState) {
      final currentState = state as CarcassonneGameState;
      final players = List<Player>.from(currentState.players);
      final playerIndex = event.playerIndex;

      if (playerIndex < players.length && players[playerIndex].score > 0) {
        final oldScore = players[playerIndex].score;
        final newScore = oldScore - 1;

        players[playerIndex] = players[playerIndex].copyWith(score: newScore);

        final history = List<ScoreHistoryItem>.from(currentState.history);
        history.add(ScoreHistoryItem(
          playerIndex: playerIndex,
          oldScore: oldScore,
          newScore: newScore,
          isIncrease: false,
        ));

        emit(currentState.copyWith(
          players: players,
          history: history,
          redoHistory: const [],
        ));
      }
    }
  }

  void _onUndo(
    UndoAction event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneGameState) {
      final currentState = state as CarcassonneGameState;

      if (currentState.history.isNotEmpty) {
        final players = List<Player>.from(currentState.players);
        final history = List<ScoreHistoryItem>.from(currentState.history);
        final redoHistory =
            List<ScoreHistoryItem>.from(currentState.redoHistory);

        final lastAction = history.removeLast();
        redoHistory.add(lastAction);

        // Revert the player's score
        players[lastAction.playerIndex] = players[lastAction.playerIndex]
            .copyWith(score: lastAction.oldScore);

        emit(currentState.copyWith(
          players: players,
          history: history,
          redoHistory: redoHistory,
        ));
      }
    }
  }

  void _onRedo(
    RedoAction event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneGameState) {
      final currentState = state as CarcassonneGameState;

      if (currentState.redoHistory.isNotEmpty) {
        final players = List<Player>.from(currentState.players);
        final history = List<ScoreHistoryItem>.from(currentState.history);
        final redoHistory =
            List<ScoreHistoryItem>.from(currentState.redoHistory);

        final actionToRedo = redoHistory.removeLast();
        history.add(actionToRedo);

        // Apply the player's score change again
        players[actionToRedo.playerIndex] = players[actionToRedo.playerIndex]
            .copyWith(score: actionToRedo.newScore);

        emit(currentState.copyWith(
          players: players,
          history: history,
          redoHistory: redoHistory,
        ));
      }
    }
  }

  void _onResetScores(
    ResetScores event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneGameState) {
      final currentState = state as CarcassonneGameState;
      final players = currentState.players
          .map((player) => player.copyWith(score: 0))
          .toList();

      emit(currentState.copyWith(
        players: players,
        history: const [],
        redoHistory: const [],
      ));
    }
  }
}
