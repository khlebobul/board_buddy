import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

part 'set_event.dart';
part 'set_state.dart';

class SetBloc extends Bloc<SetEvent, SetState> {
  SetBloc() : super(SetInitial()) {
    on<InitializeSetStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);

    // Database-related events
    on<CheckSavedGame>(_onCheckSavedGame);
    on<LoadSavedGame>(_onLoadSavedGame);
    on<DeleteSavedGame>(_onDeleteSavedGame);
    on<SaveGameSession>(_onSaveGameSession);
    on<SaveTimerValue>(_onSaveTimerValue);

    // Game screen event handlers
    on<InitializeGameScreen>(_onInitializeGameScreen);
    on<IncreaseScore>(_onIncreaseScore);
    on<DecreaseScore>(_onDecreaseScore);
    on<ResetScores>(_onResetScores);
    on<UpdateTimer>(_onUpdateTimer);
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

    add(CheckSavedGame());
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<SetState> emit,
  ) {
    if (state is SetStartScreenState) {
      final currentState = state as SetStartScreenState;
      final lowerCaseMode = event.mode.toLowerCase();
      final isSinglePlayer = lowerCaseMode.contains(S.current.singleplayer) ||
          lowerCaseMode == S.current.singleplayer;

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

  // Database event handlers
  void _onCheckSavedGame(
    CheckSavedGame event,
    Emitter<SetState> emit,
  ) async {
    if (state is SetStartScreenState) {
      final currentState = state as SetStartScreenState;
      final hasSavedGame = await DatabaseService.hasGameSession('set');
      emit(currentState.copyWith(hasSavedGame: hasSavedGame));
    }
  }

  void _onLoadSavedGame(
    LoadSavedGame event,
    Emitter<SetState> emit,
  ) async {
    debugPrint('Loading saved Set game...');
    final gameData = await DatabaseService.getLatestGameSession('set');

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

      int timerSeconds = 0;
      debugPrint('Session data: ${session.toString()}');

      if (session.containsKey('timerSeconds')) {
        timerSeconds = session['timerSeconds'] as int;
        debugPrint('Loaded timerSeconds from session: $timerSeconds');
      } else if (session.containsKey('custom_data') &&
          session['custom_data'] != null) {

        try {
          final customDataString = session['custom_data'] as String;
          final customData =
              jsonDecode(customDataString) as Map<String, dynamic>;
          if (customData.containsKey('timerSeconds')) {
            timerSeconds = customData['timerSeconds'] as int;
            debugPrint('Loaded timerSeconds from custom_data: $timerSeconds');
          }
        } catch (e) {
          debugPrint('Error parsing custom data: $e');
        }
      } else {
        debugPrint('No timer data found in saved game');
      }

      // Set up game state with loaded data
      emit(SetGameState(
        players: players,
        isSinglePlayer: session['game_mode'] == S.current.singleplayer,
        history: history,
        redoHistory: [],
        timerSeconds: timerSeconds,
      ));

      debugPrint('Game loaded successfully. Timer seconds: $timerSeconds');
    } else {
      debugPrint('No saved game found');
    }
  }

  void _onDeleteSavedGame(
    DeleteSavedGame event,
    Emitter<SetState> emit,
  ) async {
    await DatabaseService.deleteGameSession('set');

    if (state is SetStartScreenState) {
      final currentState = state as SetStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  void _onSaveGameSession(
    SaveGameSession event,
    Emitter<SetState> emit,
  ) async {
    if (state is SetGameState) {
      final gameState = state as SetGameState;

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
        await DatabaseService.deleteGameSession('set');

        final Map<String, dynamic> customData = {
          'timerSeconds': gameState.timerSeconds,
        };

        debugPrint(
            'Saving Set game session: Timer seconds = ${gameState.timerSeconds}');

        await DatabaseService.saveGameSession(
          gameType: 'set',
          scoreLimit: 0, // Set doesn't use a score limit
          gameMode: gameState.isSinglePlayer
              ? S.current.singleplayer
              : S.current.multiplayer,
          players: gameState.players,
          playerScoreHistory: playerScoreHistory,
          customData: customData,
        );

        debugPrint('Game session saved successfully');
      } catch (e) {
        debugPrint('Error saving Set game session: $e');
      }
    }
  }

  void _onSaveTimerValue(
    SaveTimerValue event,
    Emitter<SetState> emit,
  ) async {
    debugPrint('Explicit SaveTimerValue event with seconds: ${event.seconds}');

    if (state is SetGameState) {
      final gameState = state as SetGameState;

      emit(gameState.copyWith(timerSeconds: event.seconds));

      try {
        final Map<int, List<int>> playerScoreHistory = {};
        for (var item in gameState.history) {
          if (!playerScoreHistory.containsKey(item.playerIndex)) {
            playerScoreHistory[item.playerIndex] = [];
          }
          final scoreChange = item.newScore - item.oldScore;
          playerScoreHistory[item.playerIndex]!.add(scoreChange);
        }

        await DatabaseService.deleteGameSession('set');

        final Map<String, dynamic> customData = {
          'timerSeconds': event.seconds,
        };

        debugPrint('Explicitly saving timer value: ${event.seconds}');

        await DatabaseService.saveGameSession(
          gameType: 'set',
          scoreLimit: 0,
          gameMode: gameState.isSinglePlayer
              ? S.current.singleplayer
              : S.current.multiplayer,
          players: gameState.players,
          playerScoreHistory: playerScoreHistory,
          customData: customData,
        );

        debugPrint('Timer value saved successfully');
      } catch (e) {
        debugPrint('Error saving timer value: $e');
      }
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

        add(SaveGameSession());
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

          add(SaveGameSession());
        }
      }
    }
  }

  void _onUpdateTimer(
    UpdateTimer event,
    Emitter<SetState> emit,
  ) {
    if (state is SetGameState) {
      final currentState = state as SetGameState;

      debugPrint(
          'UpdateTimer: current=${currentState.timerSeconds}, new=${event.seconds}');

      if (currentState.timerSeconds != event.seconds) {
        emit(currentState.copyWith(timerSeconds: event.seconds));

        if (event.seconds == 0 || event.seconds % 5 == 0) {
          debugPrint(
              'Saving timer value at ${event.seconds} seconds (periodic saving)');
          add(SaveGameSession());
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

        add(SaveGameSession());
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

        add(SaveGameSession());
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
