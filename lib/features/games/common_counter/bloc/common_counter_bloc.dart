import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/material.dart';

part 'common_counter_event.dart';
part 'common_counter_state.dart';

class CommonCounterBloc extends Bloc<CommonCounterEvent, CommonCounterState> {
  CommonCounterBloc() : super(CommonCounterInitial()) {
    on<InitializeCommonCounterStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
    on<CheckSavedGame>(_onCheckSavedGame);
    on<LoadSavedGame>(_onLoadSavedGame);
    on<DeleteSavedGame>(_onDeleteSavedGame);

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
    on<SaveGameSession>(_onSaveGameSession);
    on<UpdateTimer>(_onUpdateTimer);
    on<SaveTimerValue>(_onSaveTimerValue);
  }

  void _onInitializeStartScreen(
    InitializeCommonCounterStartScreen event,
    Emitter<CommonCounterState> emit,
  ) {
    emit(CommonCounterStartScreenState(
      players: [],
      selectedMode: S.current.multiplayer,
      isSinglePlayer: false,
      hasSavedGame: false,
    ));

    // Check if there's a saved game
    add(CheckSavedGame());
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
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

  void _onCheckSavedGame(
    CheckSavedGame event,
    Emitter<CommonCounterState> emit,
  ) async {
    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
      final hasSavedGame =
          await DatabaseService.hasGameSession('common_counter');
      emit(currentState.copyWith(hasSavedGame: hasSavedGame));
    }
  }

  void _onLoadSavedGame(
    LoadSavedGame event,
    Emitter<CommonCounterState> emit,
  ) async {
    debugPrint('Loading saved Common Counter game...');
    final gameData =
        await DatabaseService.getLatestGameSession('common_counter');

    if (gameData != null) {
      debugPrint('Found saved game data');
      final session = gameData['session'] as Map<String, dynamic>;
      final players = gameData['players'] as List<Player>;

      // Convert to history format
      final playerScoreHistory =
          gameData['playerScoreHistory'] as Map<int, List<int>>;
      final history = <ScoreHistoryItem>[];

      for (final playerIndex in playerScoreHistory.keys) {
        int currentScore = 0;
        for (final scoreChange in playerScoreHistory[playerIndex]!) {
          final oldScore = currentScore;
          currentScore += scoreChange;
          history.add(ScoreHistoryItem(
            playerIndex: playerIndex,
            oldScore: oldScore,
            newScore: currentScore,
            isIncrease: scoreChange > 0,
          ));
        }
      }

      int timerSinglePlayer = 0;
      int timerMultiplayer = 0;
      debugPrint('Session data: ${session.toString()}');

      if (session.containsKey('timerSinglePlayer')) {
        timerSinglePlayer = session['timerSinglePlayer'] as int;
        debugPrint('Loaded timerSinglePlayer from session: $timerSinglePlayer');
      }

      if (session.containsKey('timerMultiplayer')) {
        timerMultiplayer = session['timerMultiplayer'] as int;
        debugPrint('Loaded timerMultiplayer from session: $timerMultiplayer');
      }

      if (session.containsKey('custom_data') &&
          session['custom_data'] != null) {
        try {
          final customDataString = session['custom_data'] as String;
          final customData =
              jsonDecode(customDataString) as Map<String, dynamic>;

          if (customData.containsKey('timerSinglePlayer')) {
            timerSinglePlayer = customData['timerSinglePlayer'] as int;
            debugPrint(
                'Loaded timerSinglePlayer from custom_data: $timerSinglePlayer');
          }

          if (customData.containsKey('timerMultiplayer')) {
            timerMultiplayer = customData['timerMultiplayer'] as int;
            debugPrint(
                'Loaded timerMultiplayer from custom_data: $timerMultiplayer');
          }
        } catch (e) {
          debugPrint('Error parsing custom data: $e');
        }
      }

      emit(CommonCounterGameState(
        players: players,
        isSinglePlayer: session['game_mode'] == S.current.singleplayer,
        history: history,
        redoHistory: [],
        timerSinglePlayer: timerSinglePlayer,
        timerMultiplayer: timerMultiplayer,
      ));

      debugPrint(
          'Game loaded successfully. Timer values: single=$timerSinglePlayer, multi=$timerMultiplayer');
    } else {
      debugPrint('No saved game found');
    }
  }

  void _onDeleteSavedGame(
    DeleteSavedGame event,
    Emitter<CommonCounterState> emit,
  ) async {
    await DatabaseService.deleteGameSession('common_counter');

    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  void _onSaveGameSession(
    SaveGameSession event,
    Emitter<CommonCounterState> emit,
  ) async {
    if (state is CommonCounterGameState) {
      final gameState = state as CommonCounterGameState;

      try {
        // Delete any existing common counter game sessions first
        await DatabaseService.deleteGameSession('common_counter');

        // Convert history to playerScoreHistory format
        final Map<int, List<int>> playerScoreHistory = {};

        for (final historyItem in gameState.history) {
          final playerIndex = historyItem.playerIndex;
          final scoreChange = historyItem.newScore - historyItem.oldScore;

          if (!playerScoreHistory.containsKey(playerIndex)) {
            playerScoreHistory[playerIndex] = [];
          }

          playerScoreHistory[playerIndex]!.add(scoreChange);
        }

        final Map<String, dynamic> customData = {
          'timerSinglePlayer': gameState.timerSinglePlayer,
          'timerMultiplayer': gameState.timerMultiplayer,
        };

        debugPrint(
            'Saving Common Counter game session: Timer values: single=${gameState.timerSinglePlayer}, multi=${gameState.timerMultiplayer}');

        // Save the current game session
        await DatabaseService.saveGameSession(
          gameType: 'common_counter',
          scoreLimit: 0, // Common counter doesn't have a score limit
          gameMode: gameState.isSinglePlayer
              ? S.current.singleplayer
              : S.current.multiplayer,
          players: gameState.players,
          playerScoreHistory: playerScoreHistory,
          customData: customData,
        );

        debugPrint('Game session saved successfully');
      } catch (e) {
        debugPrint('Error saving game session: $e');
      }
    }
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

        // Save game session after score update
        add(SaveGameSession());
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

          // Save game session after score update
          add(SaveGameSession());
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

        // Save game session after score update
        add(SaveGameSession());
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

        // Save game session after score update
        add(SaveGameSession());
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

      // Delete saved game when resetting
      add(DeleteSavedGame());
    }
  }

  void _onUndoAction(
    UndoAction event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;

      if (currentState.history.isNotEmpty) {
        // Get the last history item
        final lastHistoryItem = currentState.history.last;
        final playerIndex = lastHistoryItem.playerIndex;

        // Update player score to the old value
        final updatedPlayers = List<Player>.from(currentState.players);
        updatedPlayers[playerIndex].score = lastHistoryItem.oldScore;

        // Update history
        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..removeLast();
        final updatedRedoHistory =
            List<ScoreHistoryItem>.from(currentState.redoHistory)
              ..add(lastHistoryItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: updatedRedoHistory,
        ));

        // Save game session after undo
        add(SaveGameSession());
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
        // Get the last undone action
        final lastUndoneAction = currentState.redoHistory.last;
        final playerIndex = lastUndoneAction.playerIndex;

        // Update player score
        final updatedPlayers = List<Player>.from(currentState.players);
        updatedPlayers[playerIndex].score = lastUndoneAction.newScore;

        // Update history
        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(lastUndoneAction);
        final updatedRedoHistory =
            List<ScoreHistoryItem>.from(currentState.redoHistory)..removeLast();

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: updatedRedoHistory,
        ));

        // Save game session after redo
        add(SaveGameSession());
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

  void _onUpdateTimer(
    UpdateTimer event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterGameState) {
      final currentState = state as CommonCounterGameState;

      debugPrint(
          'UpdateTimer: current=${currentState.currentTimerValue}, new=${event.seconds}');

      if (currentState.isSinglePlayer) {
        if (currentState.timerSinglePlayer != event.seconds) {
          emit(currentState.copyWith(timerSinglePlayer: event.seconds));

          if (event.seconds == 0 || event.seconds % 5 == 0) {
            debugPrint(
                'Saving single player timer value at ${event.seconds} seconds (periodic saving)');
            add(SaveGameSession());
          }
        }
      } else {
        if (currentState.timerMultiplayer != event.seconds) {
          emit(currentState.copyWith(timerMultiplayer: event.seconds));

          if (event.seconds == 0 || event.seconds % 5 == 0) {
            debugPrint(
                'Saving multiplayer timer value at ${event.seconds} seconds (periodic saving)');
            add(SaveGameSession());
          }
        }
      }
    }
  }

  void _onSaveTimerValue(
    SaveTimerValue event,
    Emitter<CommonCounterState> emit,
  ) async {
    debugPrint('Explicit SaveTimerValue event with seconds: ${event.seconds}');

    if (state is CommonCounterGameState) {
      final gameState = state as CommonCounterGameState;

      if (gameState.isSinglePlayer) {
        emit(gameState.copyWith(timerSinglePlayer: event.seconds));
      } else {
        emit(gameState.copyWith(timerMultiplayer: event.seconds));
      }

      try {
        final Map<int, List<int>> playerScoreHistory = {};
        for (var item in gameState.history) {
          if (!playerScoreHistory.containsKey(item.playerIndex)) {
            playerScoreHistory[item.playerIndex] = [];
          }
          final scoreChange = item.newScore - item.oldScore;
          playerScoreHistory[item.playerIndex]!.add(scoreChange);
        }

        await DatabaseService.deleteGameSession('common_counter');

        final Map<String, dynamic> customData = {
          'timerSinglePlayer': gameState.isSinglePlayer
              ? event.seconds
              : gameState.timerSinglePlayer,
          'timerMultiplayer': !gameState.isSinglePlayer
              ? event.seconds
              : gameState.timerMultiplayer,
        };

        debugPrint(
            'Explicitly saving timer value: ${event.seconds} for ${gameState.isSinglePlayer ? "single player" : "multiplayer"}');

        await DatabaseService.saveGameSession(
          gameType: 'common_counter',
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

  // Convenience method to load saved game
  void loadSavedGame() {
    add(LoadSavedGame());
  }

  // Convenience method to delete saved game
  void deleteSavedGame() {
    add(DeleteSavedGame());
  }
}
