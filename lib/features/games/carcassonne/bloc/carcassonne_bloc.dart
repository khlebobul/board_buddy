import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';

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

    // Database-related events
    on<CheckSavedGame>(_onCheckSavedGame);
    on<LoadSavedGame>(_onLoadSavedGame);
    on<DeleteSavedGame>(_onDeleteSavedGame);
    on<SaveGameSession>(_onSaveGameSession);
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

    add(CheckSavedGame());
  }

  // Database event handlers
  void _onCheckSavedGame(
    CheckSavedGame event,
    Emitter<CarcassonneState> emit,
  ) async {
    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      final hasSavedGame = await DatabaseService.hasGameSession('carcassonne');
      emit(currentState.copyWith(hasSavedGame: hasSavedGame));
    }
  }

  void _onLoadSavedGame(
    LoadSavedGame event,
    Emitter<CarcassonneState> emit,
  ) async {
    debugPrint('Loading saved Carcassonne game...');
    final gameData = await DatabaseService.getLatestGameSession('carcassonne');

    if (gameData != null) {
      debugPrint('Found saved game data');
      final session = gameData['session'] as Map<String, dynamic>;
      final players = gameData['players'] as List<Player>;

      // Convert database score history format to our model format
      final dbScoreHistory =
          gameData['playerScoreHistory'] as Map<int, List<int>>;
      final List<ScoreHistoryItem> history = [];

      // Reconstruct score history from database data
      for (var playerIndex in dbScoreHistory.keys) {
        int currentScore = 0;
        for (var scoreChange in dbScoreHistory[playerIndex]!) {
          int oldScore = currentScore;
          currentScore += scoreChange;
          history.add(ScoreHistoryItem(
            playerIndex: playerIndex,
            oldScore: oldScore,
            newScore: currentScore,
            isIncrease: scoreChange > 0,
          ));
        }
      }

      // Set up game state with loaded data
      emit(CarcassonneGameState(
        players: players,
        isAutomatic: session['game_mode'] == 'automatic',
        history: history,
        redoHistory: [],
      ));

      debugPrint('Game loaded successfully');
    } else {
      debugPrint('No saved game found');
    }
  }

  void _onDeleteSavedGame(
    DeleteSavedGame event,
    Emitter<CarcassonneState> emit,
  ) async {
    await DatabaseService.deleteGameSession('carcassonne');

    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  void _onSaveGameSession(
    SaveGameSession event,
    Emitter<CarcassonneState> emit,
  ) async {
    if (state is CarcassonneGameState) {
      final gameState = state as CarcassonneGameState;

      // Convert our score history format to database format
      final Map<int, List<int>> playerScoreHistory = {};

      // Group history items by player
      for (var item in gameState.history) {
        if (!playerScoreHistory.containsKey(item.playerIndex)) {
          playerScoreHistory[item.playerIndex] = [];
        }
        // Calculate score change from old to new
        final scoreChange = item.newScore - item.oldScore;
        playerScoreHistory[item.playerIndex]!.add(scoreChange);
      }

      try {
        await DatabaseService.deleteGameSession('carcassonne');

        await DatabaseService.saveGameSession(
          gameType: 'carcassonne',
          scoreLimit: 0, // Carcassonne doesn't use a fixed score limit
          gameMode: gameState.isAutomatic ? 'automatic' : 'manual',
          players: gameState.players,
          playerScoreHistory: playerScoreHistory,
        );

        debugPrint('Game session saved successfully');
      } catch (e) {
        debugPrint('Error saving Carcassonne game session: $e');
      }
    }
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

        add(SaveGameSession());
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

        add(SaveGameSession());
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

        add(SaveGameSession());
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

        add(SaveGameSession());
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

      add(DeleteSavedGame());
    }
  }

  // Helper methods
  void loadSavedGame() {
    add(LoadSavedGame());
  }

  void deleteSavedGame() {
    add(DeleteSavedGame());
  }
}
