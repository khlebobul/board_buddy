import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/material.dart';

part 'catan_event.dart';
part 'catan_state.dart';

class CatanBloc extends Bloc<CatanEvent, CatanState> {
  CatanBloc() : super(CatanInitial()) {
    on<InitializeCatanStartScreen>(_onInitializeCatanStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<UpdateScoreLimit>(_onUpdateScoreLimit);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
    on<CheckSavedGame>(_onCheckSavedGame);
    on<LoadSavedGame>(_onLoadSavedGame);
    on<DeleteSavedGame>(_onDeleteSavedGame);
    on<InitializeCatanGame>(_onInitializeCatanGame);
    on<ChangeCurrentPlayer>(_onChangeCurrentPlayer);
    on<UpdatePlayerScore>(_onUpdatePlayerScore);
    on<UndoScoreChange>(_onUndoScoreChange);
    on<RedoScoreChange>(_onRedoScoreChange);
    on<ResetScoreAnimation>(_onResetScoreAnimation);
    on<StartNewGameWithSamePlayers>(_onStartNewGameWithSamePlayers);
    on<StartNewGame>(_onStartNewGame);
    on<ReturnToMenu>(_onReturnToMenu);
    on<CheckGameEnd>(_onCheckGameEnd);
    on<ContinueGame>(_onContinueGame);
    on<FinishGame>(_onFinishGame);
    on<MarkGameEndModalShown>(_onMarkGameEndModalShown);
    on<SaveGameSession>(_onSaveGameSession);
  }

  void _onInitializeCatanStartScreen(
    InitializeCatanStartScreen event,
    Emitter<CatanState> emit,
  ) {
    emit(CatanStartScreenState(
      players: [],
      selectedMode: S.current.highestScoreWins,
      scoreLimit: 10,
    ));
    add(CheckSavedGame());
  }

  void _onSelectGameMode(SelectGameMode event, Emitter<CatanState> emit) {
    if (state is CatanStartScreenState) {
      final currentState = state as CatanStartScreenState;
      emit(currentState.copyWith(selectedMode: event.mode));
    }
  }

  void _onUpdateScoreLimit(UpdateScoreLimit event, Emitter<CatanState> emit) {
    if (state is CatanStartScreenState) {
      final currentState = state as CatanStartScreenState;
      emit(currentState.copyWith(scoreLimit: event.scoreLimit));
    }
  }

  void _onAddPlayer(AddPlayer event, Emitter<CatanState> emit) {
    if (state is CatanStartScreenState) {
      final currentState = state as CatanStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onRemovePlayer(RemovePlayer event, Emitter<CatanState> emit) {
    if (state is CatanStartScreenState) {
      final currentState = state as CatanStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      if (event.index >= 0 && event.index < updatedPlayers.length) {
        updatedPlayers.removeAt(event.index);
        emit(currentState.copyWith(players: updatedPlayers));
      }
    }
  }

  void _onCheckSavedGame(CheckSavedGame event, Emitter<CatanState> emit) async {
    if (state is CatanStartScreenState) {
      final currentState = state as CatanStartScreenState;
      final hasSavedGame = await DatabaseService.hasGameSession('catan');
      emit(currentState.copyWith(hasSavedGame: hasSavedGame));
    }
  }

  void _onLoadSavedGame(LoadSavedGame event, Emitter<CatanState> emit) async {
    final gameData = await DatabaseService.getLatestGameSession('catan');
    if (gameData != null) {
      final session = gameData['session'] as Map<String, dynamic>;
      final players = gameData['players'] as List<Player>;
      final playerScoreHistory =
          gameData['playerScoreHistory'] as Map<int, List<int>>;
      final Map<int, List<int>> playerRedoStack = {};
      for (int i = 0; i < players.length; i++) {
        playerRedoStack[i] = [];
      }
      emit(CatanGameState(
        players: players,
        scoreLimit: session['score_limit'] as int,
        gameMode: session['game_mode'] as String,
        playerScoreHistory: playerScoreHistory,
        playerRedoStack: playerRedoStack,
      ));
    }
  }

  void _onDeleteSavedGame(
      DeleteSavedGame event, Emitter<CatanState> emit) async {
    await DatabaseService.deleteGameSession('catan');
    if (state is CatanStartScreenState) {
      final currentState = state as CatanStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  void _onInitializeCatanGame(
    InitializeCatanGame event,
    Emitter<CatanState> emit,
  ) {
    final Map<int, List<int>> playerScoreHistory = {};
    final Map<int, List<int>> playerRedoStack = {};
    for (int i = 0; i < event.players.length; i++) {
      playerScoreHistory[i] = [];
      playerRedoStack[i] = [];
    }
    emit(CatanGameState(
      players: event.players,
      scoreLimit: event.scoreLimit,
      gameMode: event.gameMode,
      playerScoreHistory: playerScoreHistory,
      playerRedoStack: playerRedoStack,
    ));
  }

  void _onChangeCurrentPlayer(
    ChangeCurrentPlayer event,
    Emitter<CatanState> emit,
  ) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      emit(currentState.copyWith(currentPlayerIndex: event.playerIndex));
      add(SaveGameSession());
    }
  }

  void _onUpdatePlayerScore(
    UpdatePlayerScore event,
    Emitter<CatanState> emit,
  ) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      final playerIndex = currentState.currentPlayerIndex;
      final updatedPlayers = List<Player>.from(currentState.players);
      updatedPlayers[playerIndex].score += event.scoreChange;
      final updatedScoreHistory =
          Map<int, List<int>>.from(currentState.playerScoreHistory);
      if (updatedScoreHistory[playerIndex] == null) {
        updatedScoreHistory[playerIndex] = [];
      }
      updatedScoreHistory[playerIndex]!.add(event.scoreChange);
      final updatedRedoStack =
          Map<int, List<int>>.from(currentState.playerRedoStack);
      updatedRedoStack[playerIndex] = [];
      emit(currentState.copyWith(
        players: updatedPlayers,
        playerScoreHistory: updatedScoreHistory,
        playerRedoStack: updatedRedoStack,
        lastScoreChange: event.scoreChange,
        isScoreChanging: true,
      ));
      add(SaveGameSession());
      add(CheckGameEnd());
    }
  }

  void _onUndoScoreChange(UndoScoreChange event, Emitter<CatanState> emit) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      final playerIndex = currentState.currentPlayerIndex;
      final currentPlayerHistory = currentState.playerScoreHistory[playerIndex];
      if (currentPlayerHistory != null && currentPlayerHistory.isNotEmpty) {
        final lastScoreChange = currentPlayerHistory.last;
        final updatedPlayers = List<Player>.from(currentState.players);
        updatedPlayers[playerIndex].score -= lastScoreChange;
        final updatedScoreHistory =
            Map<int, List<int>>.from(currentState.playerScoreHistory);
        updatedScoreHistory[playerIndex] = List<int>.from(currentPlayerHistory)
          ..removeLast();
        final updatedRedoStack =
            Map<int, List<int>>.from(currentState.playerRedoStack);
        if (updatedRedoStack[playerIndex] == null) {
          updatedRedoStack[playerIndex] = [];
        }
        updatedRedoStack[playerIndex]!.add(lastScoreChange);
        emit(currentState.copyWith(
          players: updatedPlayers,
          playerScoreHistory: updatedScoreHistory,
          playerRedoStack: updatedRedoStack,
          lastScoreChange: -lastScoreChange,
          isScoreChanging: true,
        ));
        add(SaveGameSession());
      }
    }
  }

  void _onRedoScoreChange(RedoScoreChange event, Emitter<CatanState> emit) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      final playerIndex = currentState.currentPlayerIndex;
      final currentPlayerRedoStack = currentState.playerRedoStack[playerIndex];
      if (currentPlayerRedoStack != null && currentPlayerRedoStack.isNotEmpty) {
        final lastUndoneScoreChange = currentPlayerRedoStack.last;
        final updatedPlayers = List<Player>.from(currentState.players);
        updatedPlayers[playerIndex].score += lastUndoneScoreChange;
        final updatedRedoStack =
            Map<int, List<int>>.from(currentState.playerRedoStack);
        updatedRedoStack[playerIndex] = List<int>.from(currentPlayerRedoStack)
          ..removeLast();
        final updatedScoreHistory =
            Map<int, List<int>>.from(currentState.playerScoreHistory);
        if (updatedScoreHistory[playerIndex] == null) {
          updatedScoreHistory[playerIndex] = [];
        }
        updatedScoreHistory[playerIndex]!.add(lastUndoneScoreChange);
        emit(currentState.copyWith(
          players: updatedPlayers,
          playerScoreHistory: updatedScoreHistory,
          playerRedoStack: updatedRedoStack,
          lastScoreChange: lastUndoneScoreChange,
          isScoreChanging: true,
        ));
        add(SaveGameSession());
        add(CheckGameEnd());
      }
    }
  }

  void _onResetScoreAnimation(
    ResetScoreAnimation event,
    Emitter<CatanState> emit,
  ) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      emit(currentState.copyWith(isScoreChanging: false));
    }
  }

  void _onCheckGameEnd(CheckGameEnd event, Emitter<CatanState> emit) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      bool gameEnded = false;
      for (final player in currentState.players) {
        if (player.score >= currentState.scoreLimit) {
          gameEnded = true;
          break;
        }
      }
      if (gameEnded && !currentState.hasShownGameEndModal) {
        emit(currentState.copyWith(gameEnded: true));
        add(DeleteSavedGame());
      }
    }
  }

  void _onSaveGameSession(
    SaveGameSession event,
    Emitter<CatanState> emit,
  ) async {
    if (state is CatanGameState) {
      final gameState = state as CatanGameState;
      try {
        await DatabaseService.deleteGameSession('catan');
        await DatabaseService.saveGameSession(
          gameType: 'catan',
          scoreLimit: gameState.scoreLimit,
          gameMode: gameState.gameMode,
          players: gameState.players,
          playerScoreHistory: gameState.playerScoreHistory,
        );
      } catch (e) {
        debugPrint('Error saving game session: $e');
      }
    }
  }

  void _onStartNewGameWithSamePlayers(
    StartNewGameWithSamePlayers event,
    Emitter<CatanState> emit,
  ) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      final updatedPlayers = List<Player>.from(currentState.players);
      for (final player in updatedPlayers) {
        player.score = 0;
      }
      final Map<int, List<int>> playerScoreHistory = {};
      final Map<int, List<int>> playerRedoStack = {};
      for (int i = 0; i < updatedPlayers.length; i++) {
        playerScoreHistory[i] = [];
        playerRedoStack[i] = [];
      }
      emit(CatanGameState(
        players: updatedPlayers,
        scoreLimit: currentState.scoreLimit,
        gameMode: currentState.gameMode,
        playerScoreHistory: playerScoreHistory,
        playerRedoStack: playerRedoStack,
        currentPlayerIndex: 0,
        gameEnded: false,
        hasShownGameEndModal: false,
      ));
      add(DeleteSavedGame());
    }
  }

  void _onStartNewGame(StartNewGame event, Emitter<CatanState> emit) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      final updatedPlayers = List<Player>.from(currentState.players);
      for (final player in updatedPlayers) {
        player.score = 0;
      }
      emit(CatanStartScreenState(
        players: updatedPlayers,
        selectedMode: currentState.gameMode,
        scoreLimit: currentState.scoreLimit,
      ));
      add(DeleteSavedGame());
    }
  }

  void _onReturnToMenu(ReturnToMenu event, Emitter<CatanState> emit) {
    add(DeleteSavedGame());
    emit(CatanInitial());
  }

  void _onContinueGame(ContinueGame event, Emitter<CatanState> emit) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      emit(currentState.copyWith(gameEnded: false));
    }
  }

  void _onFinishGame(FinishGame event, Emitter<CatanState> emit) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      emit(currentState.copyWith(gameEnded: true));
    }
  }

  void _onMarkGameEndModalShown(
    MarkGameEndModalShown event,
    Emitter<CatanState> emit,
  ) {
    if (state is CatanGameState) {
      final currentState = state as CatanGameState;
      emit(currentState.copyWith(hasShownGameEndModal: true));
    }
  }

  bool canUndo() {
    if (state is CatanGameState) {
      final gameState = state as CatanGameState;
      return gameState.canUndo();
    }
    return false;
  }

  bool canRedo() {
    if (state is CatanGameState) {
      final gameState = state as CatanGameState;
      return gameState.canRedo();
    }
    return false;
  }
}
