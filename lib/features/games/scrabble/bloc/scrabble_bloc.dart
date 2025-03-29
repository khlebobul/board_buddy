import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/material.dart';

part 'scrabble_event.dart';
part 'scrabble_state.dart';

class ScrabbleBloc extends Bloc<ScrabbleEvent, ScrabbleState> {
  ScrabbleBloc() : super(ScrabbleInitial()) {
    // Start screen events
    on<InitializeScrabbleStartScreen>(_onInitializeScrabbleStartScreen);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
    on<CheckSavedGame>(_onCheckSavedGame);
    on<LoadSavedGame>(_onLoadSavedGame);
    on<DeleteSavedGame>(_onDeleteSavedGame);

    // Game events
    on<InitializeScrabbleGame>(_onInitializeScrabbleGame);
    on<SubmitWord>(_onSubmitWord);
    on<SkipTurn>(_onSkipTurn);
    on<NextPlayer>(_onNextPlayer);
    on<ResetGame>(_onResetGame);
    on<SaveGameSession>(_onSaveGameSession);
  }

  void _onInitializeScrabbleStartScreen(
    InitializeScrabbleStartScreen event,
    Emitter<ScrabbleState> emit,
  ) {
    emit(ScrabbleStartScreenState(players: []));

    // Check if there's a saved game
    add(CheckSavedGame());
  }

  void _onAddPlayer(
    AddPlayer event,
    Emitter<ScrabbleState> emit,
  ) {
    if (state is ScrabbleStartScreenState) {
      final currentState = state as ScrabbleStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<ScrabbleState> emit,
  ) {
    if (state is ScrabbleStartScreenState) {
      final currentState = state as ScrabbleStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      if (event.index >= 0 && event.index < updatedPlayers.length) {
        updatedPlayers.removeAt(event.index);
        emit(currentState.copyWith(players: updatedPlayers));
      }
    }
  }

  void _onCheckSavedGame(
    CheckSavedGame event,
    Emitter<ScrabbleState> emit,
  ) async {
    if (state is ScrabbleStartScreenState) {
      final currentState = state as ScrabbleStartScreenState;
      final hasSavedGame = await DatabaseService.hasGameSession('scrabble');
      emit(currentState.copyWith(hasSavedGame: hasSavedGame));
    }
  }

  void _onLoadSavedGame(
    LoadSavedGame event,
    Emitter<ScrabbleState> emit,
  ) async {
    final gameData = await DatabaseService.getLatestGameSession('scrabble');

    if (gameData != null) {
      final session = gameData['session'] as Map<String, dynamic>;
      final players = gameData['players'] as List<Player>;

      // Extract move history from session data
      final List<Map<String, dynamic>> moveHistory = [];

      if (session.containsKey('moveHistory')) {
        final moveHistoryData = session['moveHistory'] as List<dynamic>;

        for (final moveData in moveHistoryData) {
          final playerIndex = moveData['playerIndex'] as int;
          final word = moveData['word'] as String;
          final score = moveData['score'] as int;
          final modifiers = moveData['modifiers'] as Map<String, dynamic>?;

          // Find the player for this move
          if (playerIndex >= 0 && playerIndex < players.length) {
            moveHistory.add({
              'player': players[playerIndex],
              'word': word,
              'score': score,
              'modifiers': modifiers,
            });
          }
        }
      }

      // Determine current player index (next player after last move)
      final currentPlayerIndex = session['currentPlayerIndex'] as int? ?? 0;

      emit(ScrabbleGameState(
        players: players,
        currentPlayerIndex: currentPlayerIndex,
        moveHistory: moveHistory,
      ));
    }
  }

  void _onDeleteSavedGame(
    DeleteSavedGame event,
    Emitter<ScrabbleState> emit,
  ) async {
    await DatabaseService.deleteGameSession('scrabble');

    if (state is ScrabbleStartScreenState) {
      final currentState = state as ScrabbleStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  void _onInitializeScrabbleGame(
    InitializeScrabbleGame event,
    Emitter<ScrabbleState> emit,
  ) {
    emit(ScrabbleGameState(
      players: event.players,
      currentPlayerIndex: 0,
      moveHistory: [],
    ));
  }

  void _onSubmitWord(
    SubmitWord event,
    Emitter<ScrabbleState> emit,
  ) {
    if (state is ScrabbleGameState) {
      final currentState = state as ScrabbleGameState;

      // Add the move to history
      final updatedMoveHistory =
          List<Map<String, dynamic>>.from(currentState.moveHistory)
            ..add({
              'player': event.player,
              'word': event.word,
              'score': event.score,
              'modifiers': event.modifiers,
            });

      // Move to next player
      final nextPlayerIndex =
          (currentState.currentPlayerIndex + 1) % currentState.players.length;

      emit(currentState.copyWith(
        moveHistory: updatedMoveHistory,
        currentPlayerIndex: nextPlayerIndex,
      ));

      // Save game session after submitting a word
      add(SaveGameSession());
    }
  }

  void _onSkipTurn(
    SkipTurn event,
    Emitter<ScrabbleState> emit,
  ) {
    if (state is ScrabbleGameState) {
      final currentState = state as ScrabbleGameState;

      // Add skip to move history
      final updatedMoveHistory =
          List<Map<String, dynamic>>.from(currentState.moveHistory)
            ..add({
              'player': event.player,
              'word': S.current.skip,
              'score': 0,
            });

      // Move to next player
      final nextPlayerIndex =
          (currentState.currentPlayerIndex + 1) % currentState.players.length;

      emit(currentState.copyWith(
        moveHistory: updatedMoveHistory,
        currentPlayerIndex: nextPlayerIndex,
      ));

      // Save game session after skipping
      add(SaveGameSession());
    }
  }

  void _onNextPlayer(
    NextPlayer event,
    Emitter<ScrabbleState> emit,
  ) {
    if (state is ScrabbleGameState) {
      final currentState = state as ScrabbleGameState;
      final nextPlayerIndex =
          (currentState.currentPlayerIndex + 1) % currentState.players.length;

      emit(currentState.copyWith(
        currentPlayerIndex: nextPlayerIndex,
      ));

      // Save game session after changing player
      add(SaveGameSession());
    }
  }

  void _onResetGame(
    ResetGame event,
    Emitter<ScrabbleState> emit,
  ) {
    if (state is ScrabbleGameState) {
      final currentState = state as ScrabbleGameState;

      if (event.keepPlayers) {
        // Reset players' scores
        final updatedPlayers = List<Player>.from(currentState.players);
        for (var player in updatedPlayers) {
          player.score = 0;
        }

        // Start new game with same players
        emit(ScrabbleGameState(
          players: updatedPlayers,
          currentPlayerIndex: 0,
          moveHistory: [],
        ));
      } else {
        emit(ScrabbleStartScreenState(players: currentState.players));
      }

      // Delete saved game when resetting
      add(DeleteSavedGame());
    }
  }

  void _onSaveGameSession(
    SaveGameSession event,
    Emitter<ScrabbleState> emit,
  ) async {
    if (state is ScrabbleGameState) {
      final gameState = state as ScrabbleGameState;

      try {
        // Delete any existing scrabble game sessions first
        await DatabaseService.deleteGameSession('scrabble');

        // Convert move history to a format that can be saved
        final List<Map<String, dynamic>> moveHistoryData = [];

        for (final move in gameState.moveHistory) {
          final player = move['player'] as Player;
          final word = move['word'] as String;
          final score = move['score'] as int;
          final modifiers = move['modifiers'] as Map<String, dynamic>?;

          // Find player index
          final playerIndex =
              gameState.players.indexWhere((p) => p.id == player.id);
          if (playerIndex != -1) {
            moveHistoryData.add({
              'playerIndex': playerIndex,
              'word': word,
              'score': score,
              'modifiers': modifiers,
            });
          }
        }

        // Custom data to store
        final Map<String, dynamic> customData = {
          'moveHistory': moveHistoryData,
          'currentPlayerIndex': gameState.currentPlayerIndex,
        };

        // Save the current game session
        await DatabaseService.saveGameSession(
          gameType: 'scrabble',
          scoreLimit: 0, // Scrabble doesn't use a score limit
          gameMode: 'standard',
          players: gameState.players,
          playerScoreHistory: {
            0: [0]
          }, // Dummy data, only used to satisfy the API
          customData: customData,
        );
      } catch (e) {
        debugPrint('Error saving scrabble game session: $e');
      }
    }
  }

  // Convenience methods
  void loadSavedGame() {
    add(LoadSavedGame());
  }

  void deleteSavedGame() {
    add(DeleteSavedGame());
  }
}
