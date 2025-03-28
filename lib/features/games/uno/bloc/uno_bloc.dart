import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/material.dart';

part 'uno_event.dart';
part 'uno_state.dart';

class UnoBloc extends Bloc<UnoEvent, UnoState> {
  UnoBloc() : super(UnoInitial()) {
    // Start screen events
    on<InitializeUnoStartScreen>(_onInitializeUnoStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<UpdateScoreLimit>(_onUpdateScoreLimit);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
    on<CheckSavedGame>(_onCheckSavedGame);
    on<LoadSavedGame>(_onLoadSavedGame);
    on<DeleteSavedGame>(_onDeleteSavedGame);

    // Game events
    on<InitializeUnoGame>(_onInitializeUnoGame);
    on<ChangeCurrentPlayer>(_onChangeCurrentPlayer);
    on<UpdatePlayerScore>(_onUpdatePlayerScore);
    on<UndoScoreChange>(_onUndoScoreChange);
    on<RedoScoreChange>(_onRedoScoreChange);
    on<ResetScoreAnimation>(_onResetScoreAnimation);
    on<StartNewGameWithSamePlayers>(_onStartNewGameWithSamePlayers);
    on<StartNewGame>(_onStartNewGame);
    on<ReturnToMenu>(_onReturnToMenu);
    on<CheckGameEnd>(_onCheckGameEnd);
    on<SaveGameSession>(_onSaveGameSession);
  }

  // Start screen event handlers
  void _onInitializeUnoStartScreen(
    InitializeUnoStartScreen event,
    Emitter<UnoState> emit,
  ) {
    emit(UnoStartScreenState(
      players: [],
      selectedMode: S.current.highestScoreWins,
      scoreLimit: 500,
    ));

    // Check if there's a saved game
    add(CheckSavedGame());
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoStartScreenState) {
      final currentState = state as UnoStartScreenState;
      emit(currentState.copyWith(selectedMode: event.mode));
    }
  }

  void _onUpdateScoreLimit(
    UpdateScoreLimit event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoStartScreenState) {
      final currentState = state as UnoStartScreenState;
      emit(currentState.copyWith(scoreLimit: event.scoreLimit));
    }
  }

  void _onAddPlayer(
    AddPlayer event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoStartScreenState) {
      final currentState = state as UnoStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoStartScreenState) {
      final currentState = state as UnoStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      if (event.index >= 0 && event.index < updatedPlayers.length) {
        updatedPlayers.removeAt(event.index);
        emit(currentState.copyWith(players: updatedPlayers));
      }
    }
  }

  void _onCheckSavedGame(
    CheckSavedGame event,
    Emitter<UnoState> emit,
  ) async {
    if (state is UnoStartScreenState) {
      final currentState = state as UnoStartScreenState;
      final hasSavedGame = await DatabaseService.hasGameSession('uno');
      emit(currentState.copyWith(hasSavedGame: hasSavedGame));
    }
  }

  void _onLoadSavedGame(
    LoadSavedGame event,
    Emitter<UnoState> emit,
  ) async {
    final gameData = await DatabaseService.getLatestGameSession('uno');

    if (gameData != null) {
      final session = gameData['session'] as Map<String, dynamic>;
      final players = gameData['players'] as List<Player>;
      final playerScoreHistory =
          gameData['playerScoreHistory'] as Map<int, List<int>>;

      // Create empty redo stacks
      final Map<int, List<int>> playerRedoStack = {};
      for (int i = 0; i < players.length; i++) {
        playerRedoStack[i] = [];
      }

      emit(UnoGameState(
        players: players,
        scoreLimit: session['score_limit'] as int,
        gameMode: session['game_mode'] as String,
        playerScoreHistory: playerScoreHistory,
        playerRedoStack: playerRedoStack,
      ));
    }
  }

  void _onDeleteSavedGame(
    DeleteSavedGame event,
    Emitter<UnoState> emit,
  ) async {
    await DatabaseService.deleteGameSession('uno');

    if (state is UnoStartScreenState) {
      final currentState = state as UnoStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  // Game event handlers
  void _onInitializeUnoGame(
    InitializeUnoGame event,
    Emitter<UnoState> emit,
  ) {
    // Initialize player score history and redo stacks
    final Map<int, List<int>> playerScoreHistory = {};
    final Map<int, List<int>> playerRedoStack = {};

    for (int i = 0; i < event.players.length; i++) {
      playerScoreHistory[i] = [];
      playerRedoStack[i] = [];
    }

    emit(UnoGameState(
      players: event.players,
      scoreLimit: event.scoreLimit,
      gameMode: event.gameMode,
      playerScoreHistory: playerScoreHistory,
      playerRedoStack: playerRedoStack,
    ));
  }

  void _onChangeCurrentPlayer(
    ChangeCurrentPlayer event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoGameState) {
      final currentState = state as UnoGameState;
      emit(currentState.copyWith(currentPlayerIndex: event.playerIndex));

      // Save game state after changing player
      add(SaveGameSession());
    }
  }

  void _onUpdatePlayerScore(
    UpdatePlayerScore event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoGameState) {
      final currentState = state as UnoGameState;
      final playerIndex = currentState.currentPlayerIndex;

      // Update player score
      final updatedPlayers = List<Player>.from(currentState.players);
      updatedPlayers[playerIndex].score += event.scoreChange;

      // Update score history
      final updatedScoreHistory =
          Map<int, List<int>>.from(currentState.playerScoreHistory);
      if (updatedScoreHistory[playerIndex] == null) {
        updatedScoreHistory[playerIndex] = [];
      }
      updatedScoreHistory[playerIndex]!.add(event.scoreChange);

      // Clear redo stack for this player
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

      // Save game session after score update
      add(SaveGameSession());

      // Check if game has ended
      add(CheckGameEnd());
    }
  }

  void _onUndoScoreChange(
    UndoScoreChange event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoGameState) {
      final currentState = state as UnoGameState;
      final playerIndex = currentState.currentPlayerIndex;

      final currentPlayerHistory = currentState.playerScoreHistory[playerIndex];
      if (currentPlayerHistory != null && currentPlayerHistory.isNotEmpty) {
        // Get the last score change
        final lastScoreChange = currentPlayerHistory.last;

        // Update player score
        final updatedPlayers = List<Player>.from(currentState.players);
        updatedPlayers[playerIndex].score -= lastScoreChange;

        // Update score history
        final updatedScoreHistory =
            Map<int, List<int>>.from(currentState.playerScoreHistory);
        updatedScoreHistory[playerIndex] = List<int>.from(currentPlayerHistory)
          ..removeLast();

        // Update redo stack
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

        // Save game session after undo
        add(SaveGameSession());
      }
    }
  }

  void _onRedoScoreChange(
    RedoScoreChange event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoGameState) {
      final currentState = state as UnoGameState;
      final playerIndex = currentState.currentPlayerIndex;

      final currentPlayerRedoStack = currentState.playerRedoStack[playerIndex];
      if (currentPlayerRedoStack != null && currentPlayerRedoStack.isNotEmpty) {
        // Get the last undone score change
        final lastUndoneScoreChange = currentPlayerRedoStack.last;

        // Update player score
        final updatedPlayers = List<Player>.from(currentState.players);
        updatedPlayers[playerIndex].score += lastUndoneScoreChange;

        // Update redo stack
        final updatedRedoStack =
            Map<int, List<int>>.from(currentState.playerRedoStack);
        updatedRedoStack[playerIndex] = List<int>.from(currentPlayerRedoStack)
          ..removeLast();

        // Update score history
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

        // Save game session after redo
        add(SaveGameSession());

        // Check if game has ended
        add(CheckGameEnd());
      }
    }
  }

  void _onResetScoreAnimation(
    ResetScoreAnimation event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoGameState) {
      final currentState = state as UnoGameState;
      emit(currentState.copyWith(isScoreChanging: false));
    }
  }

  void _onCheckGameEnd(
    CheckGameEnd event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoGameState) {
      final currentState = state as UnoGameState;
      bool gameEnded = false;

      if (currentState.gameMode == S.current.highestScoreWins ||
          currentState.gameMode == S.current.lowestScoreWins) {
        // Check if any player has reached or exceeded the score limit
        for (final player in currentState.players) {
          if (player.score >= currentState.scoreLimit) {
            gameEnded = true;
            break;
          }
        }
      }

      if (gameEnded) {
        emit(currentState.copyWith(gameEnded: true));

        // Delete saved game when a game ends
        add(DeleteSavedGame());
      }
    }
  }

  void _onSaveGameSession(
    SaveGameSession event,
    Emitter<UnoState> emit,
  ) async {
    if (state is UnoGameState) {
      final gameState = state as UnoGameState;

      try {
        // Delete any existing UNO game sessions first
        await DatabaseService.deleteGameSession('uno');

        // Save the current game session
        await DatabaseService.saveGameSession(
          gameType: 'uno',
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
    Emitter<UnoState> emit,
  ) {
    if (state is UnoGameState) {
      final currentState = state as UnoGameState;

      // Reset scores for all players
      final updatedPlayers = List<Player>.from(currentState.players);
      for (final player in updatedPlayers) {
        player.score = 0;
      }

      // Reset game state
      final Map<int, List<int>> playerScoreHistory = {};
      final Map<int, List<int>> playerRedoStack = {};

      for (int i = 0; i < updatedPlayers.length; i++) {
        playerScoreHistory[i] = [];
        playerRedoStack[i] = [];
      }

      emit(UnoGameState(
        players: updatedPlayers,
        scoreLimit: currentState.scoreLimit,
        gameMode: currentState.gameMode,
        playerScoreHistory: playerScoreHistory,
        playerRedoStack: playerRedoStack,
        currentPlayerIndex: 0,
        gameEnded: false,
      ));

      // Delete the saved game session when starting a new game
      add(DeleteSavedGame());
    }
  }

  void _onStartNewGame(
    StartNewGame event,
    Emitter<UnoState> emit,
  ) {
    if (state is UnoGameState) {
      final currentState = state as UnoGameState;

      // Reset scores for all players
      final updatedPlayers = List<Player>.from(currentState.players);
      for (final player in updatedPlayers) {
        player.score = 0;
      }

      emit(UnoStartScreenState(
        players: updatedPlayers,
        selectedMode: currentState.gameMode,
        scoreLimit: currentState.scoreLimit,
      ));

      // Delete the saved game session when returning to start screen
      add(DeleteSavedGame());
    }
  }

  void _onReturnToMenu(
    ReturnToMenu event,
    Emitter<UnoState> emit,
  ) {
    // Delete the saved game session when returning to menu
    add(DeleteSavedGame());

    // Just emit initial state, navigation will be handled in the UI
    emit(UnoInitial());
  }

  // Helper methods for working with state

  // Checks if the current player can undo the last action
  bool canUndo() {
    if (state is UnoGameState) {
      final gameState = state as UnoGameState;
      return gameState.canUndo();
    }
    return false;
  }

  // Checks if the current player can redo the canceled action
  bool canRedo() {
    if (state is UnoGameState) {
      final gameState = state as UnoGameState;
      return gameState.canRedo();
    }
    return false;
  }

  // Updates player's score
  void updateScore(int scoreChange) {
    add(UpdatePlayerScore(scoreChange));
  }

  // Cancels the last score change
  void undo() {
    add(UndoScoreChange());
  }

  // Repeats the canceled score change
  void redo() {
    add(RedoScoreChange());
  }

  // Resets the score change animation
  void resetScoreAnimation() {
    add(ResetScoreAnimation());
  }

  // Starts a new game with the same players
  void startNewGameWithSamePlayers() {
    add(StartNewGameWithSamePlayers());
  }

  // Starts a new game
  void startNewGame() {
    add(StartNewGame());
  }

  // Returns to the main menu
  void returnToMenu() {
    add(ReturnToMenu());
  }

  // Load a saved game
  void loadSavedGame() {
    add(LoadSavedGame());
  }

  // Delete the saved game
  void deleteSavedGame() {
    add(DeleteSavedGame());
  }
}
