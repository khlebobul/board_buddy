import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:meta/meta.dart';

part 'uno_flip_event.dart';
part 'uno_flip_state.dart';

class UnoFlipBloc extends Bloc<UnoFlipEvent, UnoFlipState> {
  UnoFlipBloc() : super(UnoFlipInitial()) {
    // Start screen events
    on<InitializeUnoFlipStartScreen>(_onInitializeUnoFlipStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<UpdateScoreLimit>(_onUpdateScoreLimit);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);

    // Game events
    on<InitializeUnoFlipGame>(_onInitializeUnoFlipGame);
    on<ChangeCurrentPlayer>(_onChangeCurrentPlayer);
    on<UpdatePlayerScore>(_onUpdatePlayerScore);
    on<UndoScoreChange>(_onUndoScoreChange);
    on<RedoScoreChange>(_onRedoScoreChange);
    on<ResetScoreAnimation>(_onResetScoreAnimation);
    on<StartNewGameWithSamePlayers>(_onStartNewGameWithSamePlayers);
    on<StartNewGame>(_onStartNewGame);
    on<ReturnToMenu>(_onReturnToMenu);
    on<CheckGameEnd>(_onCheckGameEnd);
  }

  // Start screen event handlers
  void _onInitializeUnoFlipStartScreen(
    InitializeUnoFlipStartScreen event,
    Emitter<UnoFlipState> emit,
  ) {
    emit(UnoFlipStartScreenState(
      players: [],
      selectedMode: S.current.highestScoreWins,
      scoreLimit: 500,
    ));
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipStartScreenState) {
      final currentState = state as UnoFlipStartScreenState;
      emit(currentState.copyWith(selectedMode: event.mode));
    }
  }

  void _onUpdateScoreLimit(
    UpdateScoreLimit event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipStartScreenState) {
      final currentState = state as UnoFlipStartScreenState;
      emit(currentState.copyWith(scoreLimit: event.scoreLimit));
    }
  }

  void _onAddPlayer(
    AddPlayer event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipStartScreenState) {
      final currentState = state as UnoFlipStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipStartScreenState) {
      final currentState = state as UnoFlipStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      if (event.index >= 0 && event.index < updatedPlayers.length) {
        updatedPlayers.removeAt(event.index);
        emit(currentState.copyWith(players: updatedPlayers));
      }
    }
  }

  // Game event handlers
  void _onInitializeUnoFlipGame(
    InitializeUnoFlipGame event,
    Emitter<UnoFlipState> emit,
  ) {
    // Initialize player score history and redo stacks
    final Map<int, List<int>> playerScoreHistory = {};
    final Map<int, List<int>> playerRedoStack = {};

    for (int i = 0; i < event.players.length; i++) {
      playerScoreHistory[i] = [];
      playerRedoStack[i] = [];
    }

    emit(UnoFlipGameState(
      players: event.players,
      scoreLimit: event.scoreLimit,
      gameMode: event.gameMode,
      playerScoreHistory: playerScoreHistory,
      playerRedoStack: playerRedoStack,
    ));
  }

  void _onChangeCurrentPlayer(
    ChangeCurrentPlayer event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipGameState) {
      final currentState = state as UnoFlipGameState;
      emit(currentState.copyWith(currentPlayerIndex: event.playerIndex));
    }
  }

  void _onUpdatePlayerScore(
    UpdatePlayerScore event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipGameState) {
      final currentState = state as UnoFlipGameState;
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

      // Check if game has ended
      add(CheckGameEnd());
    }
  }

  void _onUndoScoreChange(
    UndoScoreChange event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipGameState) {
      final currentState = state as UnoFlipGameState;
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
      }
    }
  }

  void _onRedoScoreChange(
    RedoScoreChange event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipGameState) {
      final currentState = state as UnoFlipGameState;
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

        // Check if game has ended
        add(CheckGameEnd());
      }
    }
  }

  void _onResetScoreAnimation(
    ResetScoreAnimation event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipGameState) {
      final currentState = state as UnoFlipGameState;
      emit(currentState.copyWith(isScoreChanging: false));
    }
  }

  void _onCheckGameEnd(
    CheckGameEnd event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipGameState) {
      final currentState = state as UnoFlipGameState;
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
      }
    }
  }

  void _onStartNewGameWithSamePlayers(
    StartNewGameWithSamePlayers event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipGameState) {
      final currentState = state as UnoFlipGameState;

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

      emit(UnoFlipGameState(
        players: updatedPlayers,
        scoreLimit: currentState.scoreLimit,
        gameMode: currentState.gameMode,
        playerScoreHistory: playerScoreHistory,
        playerRedoStack: playerRedoStack,
        currentPlayerIndex: 0,
        gameEnded: false,
      ));
    }
  }

  void _onStartNewGame(
    StartNewGame event,
    Emitter<UnoFlipState> emit,
  ) {
    if (state is UnoFlipGameState) {
      final currentState = state as UnoFlipGameState;

      // Reset scores for all players
      final updatedPlayers = List<Player>.from(currentState.players);
      for (final player in updatedPlayers) {
        player.score = 0;
      }

      // Return to start screen
      emit(UnoFlipStartScreenState(
        players: updatedPlayers,
        selectedMode: currentState.gameMode,
        scoreLimit: currentState.scoreLimit,
      ));
    }
  }

  void _onReturnToMenu(
    ReturnToMenu event,
    Emitter<UnoFlipState> emit,
  ) {
    // Just emit initial state, navigation will be handled in the UI
    emit(UnoFlipInitial());
  }

  // Helper methods for working with state

  // Checks if the current player can undo the last action
  bool canUndo() {
    if (state is UnoFlipGameState) {
      final gameState = state as UnoFlipGameState;
      return gameState.canUndo();
    }
    return false;
  }

  // Checks if the current player can redo the canceled action
  bool canRedo() {
    if (state is UnoFlipGameState) {
      final gameState = state as UnoFlipGameState;
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
}
