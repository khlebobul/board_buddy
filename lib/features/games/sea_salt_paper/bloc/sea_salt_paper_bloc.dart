import 'package:bloc/bloc.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:flutter/material.dart';

part 'sea_salt_paper_event.dart';
part 'sea_salt_paper_state.dart';

class SeaSaltPaperBloc extends Bloc<SeaSaltPaperEvent, SeaSaltPaperState> {
  SeaSaltPaperBloc() : super(SeaSaltPaperInitial()) {
    // Start screen events
    on<InitializeSeaSaltPaperStartScreen>(_onInitializeStartScreen);
    on<AddSeaSaltPaperPlayer>(_onAddPlayer);
    on<RemoveSeaSaltPaperPlayer>(_onRemovePlayer);
    on<CheckSavedSeaSaltPaperGame>(_onCheckSavedGame);
    on<LoadSavedSeaSaltPaperGame>(_onLoadSavedGame);
    on<DeleteSavedSeaSaltPaperGame>(_onDeleteSavedGame);
    on<UpdateSeaSaltPaperScoreLimit>(_onUpdateScoreLimit);

    // Game events
    on<InitializeSeaSaltPaperGame>(_onInitializeGame);
    on<ChangeSeaSaltPaperCurrentPlayer>(_onChangeCurrentPlayer);
    on<UpdateSeaSaltPaperPlayerScore>(_onUpdatePlayerScore);
    on<UndoSeaSaltPaperScoreChange>(_onUndoScoreChange);
    on<RedoSeaSaltPaperScoreChange>(_onRedoScoreChange);
    on<ResetSeaSaltPaperScoreAnimation>(_onResetScoreAnimation);
    on<StartNewSeaSaltPaperGameWithSamePlayers>(_onStartNewGameWithSamePlayers);
    on<StartNewSeaSaltPaperGame>(_onStartNewGame);
    on<ReturnSeaSaltPaperToMenu>(_onReturnToMenu);
    on<CheckSeaSaltPaperGameEnd>(_onCheckGameEnd);
    on<ContinueSeaSaltPaperGame>(_onContinueGame);
    on<FinishSeaSaltPaperGame>(_onFinishGame);
    on<MarkSeaSaltPaperGameEndModalShown>(_onMarkGameEndModalShown);
    on<SaveSeaSaltPaperGameSession>(_onSaveGameSession);

    // Sea Salt & Paper specific
    on<DeclareMermaidVictory>(_onDeclareMermaidVictory);
  }

  // Start screen handlers
  void _onInitializeStartScreen(
    InitializeSeaSaltPaperStartScreen event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    emit(SeaSaltPaperStartScreenState(
      players: [],
      scoreLimit: SeaSaltPaperScoreLimit.getScoreLimit(2),
    ));
    add(CheckSavedSeaSaltPaperGame());
  }

  void _onAddPlayer(
    AddSeaSaltPaperPlayer event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperStartScreenState) {
      final currentState = state as SeaSaltPaperStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);

      final newScoreLimit =
          SeaSaltPaperScoreLimit.getScoreLimit(updatedPlayers.length);

      emit(currentState.copyWith(
        players: updatedPlayers,
        scoreLimit: newScoreLimit,
        isCustomScoreLimit: false,
      ));
    } else if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);

      final updatedScoreHistory =
          Map<int, List<int>>.from(currentState.playerScoreHistory);
      final updatedRedoStack =
          Map<int, List<int>>.from(currentState.playerRedoStack);

      final newIndex = updatedPlayers.length - 1;
      updatedScoreHistory[newIndex] = [];
      updatedRedoStack[newIndex] = [];

      emit(currentState.copyWith(
        players: updatedPlayers,
        playerScoreHistory: updatedScoreHistory,
        playerRedoStack: updatedRedoStack,
      ));

      add(SaveSeaSaltPaperGameSession());
    }
  }

  void _onRemovePlayer(
    RemoveSeaSaltPaperPlayer event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperStartScreenState) {
      final currentState = state as SeaSaltPaperStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      if (event.index >= 0 && event.index < updatedPlayers.length) {
        updatedPlayers.removeAt(event.index);

        final newScoreLimit = updatedPlayers.isEmpty
            ? SeaSaltPaperScoreLimit.getScoreLimit(2)
            : SeaSaltPaperScoreLimit.getScoreLimit(updatedPlayers.length);

        emit(currentState.copyWith(
          players: updatedPlayers,
          scoreLimit: newScoreLimit,
          isCustomScoreLimit: false,
        ));
      }
    }
  }

  void _onCheckSavedGame(
    CheckSavedSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) async {
    if (state is SeaSaltPaperStartScreenState) {
      final currentState = state as SeaSaltPaperStartScreenState;
      final hasSavedGame =
          await DatabaseService.hasGameSession('sea_salt_paper');
      emit(currentState.copyWith(hasSavedGame: hasSavedGame));
    }
  }

  void _onLoadSavedGame(
    LoadSavedSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) async {
    final gameData =
        await DatabaseService.getLatestGameSession('sea_salt_paper');

    if (gameData != null) {
      final session = gameData['session'] as Map<String, dynamic>;
      final players = gameData['players'] as List<Player>;
      final playerScoreHistory =
          gameData['playerScoreHistory'] as Map<int, List<int>>;

      final Map<int, List<int>> playerRedoStack = {};
      for (int i = 0; i < players.length; i++) {
        playerRedoStack[i] = [];
      }

      emit(SeaSaltPaperGameState(
        players: players,
        scoreLimit: session['score_limit'] as int,
        playerScoreHistory: playerScoreHistory,
        playerRedoStack: playerRedoStack,
      ));
    }
  }

  void _onDeleteSavedGame(
    DeleteSavedSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) async {
    await DatabaseService.deleteGameSession('sea_salt_paper');

    if (state is SeaSaltPaperStartScreenState) {
      final currentState = state as SeaSaltPaperStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  void _onUpdateScoreLimit(
    UpdateSeaSaltPaperScoreLimit event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperStartScreenState) {
      final currentState = state as SeaSaltPaperStartScreenState;
      final isCustom = event.scoreLimit != currentState.defaultScoreLimit;
      emit(currentState.copyWith(
        scoreLimit: event.scoreLimit,
        isCustomScoreLimit: isCustom,
      ));
    }
  }

  // Game handlers
  void _onInitializeGame(
    InitializeSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    final Map<int, List<int>> playerScoreHistory = {};
    final Map<int, List<int>> playerRedoStack = {};

    for (int i = 0; i < event.players.length; i++) {
      playerScoreHistory[i] = [];
      playerRedoStack[i] = [];
    }

    emit(SeaSaltPaperGameState(
      players: event.players,
      scoreLimit: event.scoreLimit,
      playerScoreHistory: playerScoreHistory,
      playerRedoStack: playerRedoStack,
    ));
  }

  void _onChangeCurrentPlayer(
    ChangeSeaSaltPaperCurrentPlayer event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
      emit(currentState.copyWith(currentPlayerIndex: event.playerIndex));
      add(SaveSeaSaltPaperGameSession());
    }
  }

  void _onUpdatePlayerScore(
    UpdateSeaSaltPaperPlayerScore event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
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

      add(SaveSeaSaltPaperGameSession());
      add(CheckSeaSaltPaperGameEnd());
    }
  }

  void _onUndoScoreChange(
    UndoSeaSaltPaperScoreChange event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
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

        add(SaveSeaSaltPaperGameSession());
      }
    }
  }

  void _onRedoScoreChange(
    RedoSeaSaltPaperScoreChange event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
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

        add(SaveSeaSaltPaperGameSession());
        add(CheckSeaSaltPaperGameEnd());
      }
    }
  }

  void _onResetScoreAnimation(
    ResetSeaSaltPaperScoreAnimation event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
      emit(currentState.copyWith(isScoreChanging: false));
    }
  }

  void _onCheckGameEnd(
    CheckSeaSaltPaperGameEnd event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
      bool gameEnded = false;

      for (final player in currentState.players) {
        if (player.score >= currentState.scoreLimit) {
          gameEnded = true;
          break;
        }
      }

      if (gameEnded && !currentState.hasShownGameEndModal) {
        emit(currentState.copyWith(gameEnded: true));
        add(DeleteSavedSeaSaltPaperGame());
      }
    }
  }

  void _onSaveGameSession(
    SaveSeaSaltPaperGameSession event,
    Emitter<SeaSaltPaperState> emit,
  ) async {
    if (state is SeaSaltPaperGameState) {
      final gameState = state as SeaSaltPaperGameState;

      try {
        await DatabaseService.deleteGameSession('sea_salt_paper');
        await DatabaseService.saveGameSession(
          gameType: 'sea_salt_paper',
          scoreLimit: gameState.scoreLimit,
          gameMode: 'highest_score_wins',
          players: gameState.players,
          playerScoreHistory: gameState.playerScoreHistory,
        );
      } catch (e) {
        debugPrint('Error saving game session: $e');
      }
    }
  }

  void _onStartNewGameWithSamePlayers(
    StartNewSeaSaltPaperGameWithSamePlayers event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;

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

      emit(SeaSaltPaperGameState(
        players: updatedPlayers,
        scoreLimit: currentState.scoreLimit,
        playerScoreHistory: playerScoreHistory,
        playerRedoStack: playerRedoStack,
        currentPlayerIndex: 0,
        gameEnded: false,
        hasShownGameEndModal: false,
        mermaidVictory: false,
      ));

      add(DeleteSavedSeaSaltPaperGame());
    }
  }

  void _onStartNewGame(
    StartNewSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;

      final updatedPlayers = List<Player>.from(currentState.players);
      for (final player in updatedPlayers) {
        player.score = 0;
      }

      emit(SeaSaltPaperStartScreenState(
        players: updatedPlayers,
        scoreLimit: currentState.scoreLimit,
      ));

      add(DeleteSavedSeaSaltPaperGame());
    }
  }

  void _onReturnToMenu(
    ReturnSeaSaltPaperToMenu event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    add(DeleteSavedSeaSaltPaperGame());
    emit(SeaSaltPaperInitial());
  }

  void _onContinueGame(
    ContinueSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
      emit(currentState.copyWith(gameEnded: false));
    }
  }

  void _onFinishGame(
    FinishSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
      emit(currentState.copyWith(gameEnded: true));
    }
  }

  void _onMarkGameEndModalShown(
    MarkSeaSaltPaperGameEndModalShown event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
      emit(currentState.copyWith(hasShownGameEndModal: true));
    }
  }

  // Sea Salt & Paper specific handlers
  void _onDeclareMermaidVictory(
    DeclareMermaidVictory event,
    Emitter<SeaSaltPaperState> emit,
  ) {
    if (state is SeaSaltPaperGameState) {
      final currentState = state as SeaSaltPaperGameState;
      emit(currentState.copyWith(
        mermaidVictory: true,
        gameEnded: true,
      ));
      add(DeleteSavedSeaSaltPaperGame());
    }
  }

  // Helper methods
  bool canUndo() {
    if (state is SeaSaltPaperGameState) {
      final gameState = state as SeaSaltPaperGameState;
      return gameState.canUndo();
    }
    return false;
  }

  bool canRedo() {
    if (state is SeaSaltPaperGameState) {
      final gameState = state as SeaSaltPaperGameState;
      return gameState.canRedo();
    }
    return false;
  }

  void updateScore(int scoreChange) {
    add(UpdateSeaSaltPaperPlayerScore(scoreChange));
  }

  void undo() {
    add(UndoSeaSaltPaperScoreChange());
  }

  void redo() {
    add(RedoSeaSaltPaperScoreChange());
  }

  void resetScoreAnimation() {
    add(ResetSeaSaltPaperScoreAnimation());
  }

  void startNewGameWithSamePlayers() {
    add(StartNewSeaSaltPaperGameWithSamePlayers());
  }

  void startNewGame() {
    add(StartNewSeaSaltPaperGame());
  }

  void returnToMenu() {
    add(ReturnSeaSaltPaperToMenu());
  }

  void continueGame() {
    add(ContinueSeaSaltPaperGame());
  }

  void finishGame() {
    add(FinishSeaSaltPaperGame());
  }

  void markGameEndModalShown() {
    add(MarkSeaSaltPaperGameEndModalShown());
  }
}
