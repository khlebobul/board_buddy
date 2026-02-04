import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/material.dart';

part 'munchkin_event.dart';
part 'munchkin_state.dart';

class MunchkinBloc extends Bloc<MunchkinEvent, MunchkinState> {
  MunchkinBloc() : super(MunchkinInitial()) {
    on<InitializeMunchkinStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);

    // Game screen event handlers
    on<InitializeGameScreen>(_onInitializeGameScreen);
    on<IncreaseScore>(_onIncreaseScore);
    on<DecreaseScore>(_onDecreaseScore);
    on<IncreaseGear>(_onIncreaseGear);
    on<DecreaseGear>(_onDecreaseGear);
    on<IncreaseLevel>(_onIncreaseLevel);
    on<DecreaseLevel>(_onDecreaseLevel);
    on<ResetScores>(_onResetScores);
    on<ResetPlayerModifiers>(_onResetPlayerModifiers);
    on<UpdatePlayerModifier>(_onUpdatePlayerModifier);
    on<TogglePlayerGender>(_onTogglePlayerGender);
    on<TogglePlayerCursed>(_onTogglePlayerCursed);
    on<UndoAction>(_onUndoAction);
    on<RedoAction>(_onRedoAction);

    // Temporary modifier event handlers
    on<AddTemporaryModifier>(_onAddTemporaryModifier);
    on<ClearTemporaryModifiers>(_onClearTemporaryModifiers);

    // Database-related event handlers
    on<CheckSavedGame>(_onCheckSavedGame);
    on<LoadSavedGame>(_onLoadSavedGame);
    on<GameLoaded>(_onGameLoaded);
    on<DeleteSavedGame>(_onDeleteSavedGame);
    on<SaveGameSession>(_onSaveGameSession);
  }

  void _onInitializeStartScreen(
    InitializeMunchkinStartScreen event,
    Emitter<MunchkinState> emit,
  ) {
    emit(MunchkinStartScreenState(
      players: [],
      selectedMode: S.current.multiplayer,
      isSinglePlayer: false,
    ));

    // Check if there's a saved game
    add(CheckSavedGame());
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinStartScreenState) {
      final currentState = state as MunchkinStartScreenState;
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
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinStartScreenState) {
      final currentState = state as MunchkinStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    } else if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final initializedPlayer = Player(
        name: event.player.name,
        id: event.player.id,
        score: 1, // Munchkin starts at level 1
        gear: 0,
        level: 1,
        modifiers: PlayerModifiers(),
        isMale: event.player.isMale,
        isCursed: false,
        temporaryModifier: 0,
      );
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(initializedPlayer);

      emit(currentState.copyWith(
        players: updatedPlayers,
      ));

      add(SaveGameSession());
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinStartScreenState) {
      final currentState = state as MunchkinStartScreenState;
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
    Emitter<MunchkinState> emit,
  ) {
    final initializedPlayers = event.players.map((player) {
      final hasExistingProgress = player.level != 1 || player.gear != 0 || player.temporaryModifier != 0;

      if (hasExistingProgress) {
        return Player(
          name: player.name,
          id: player.id,
          score: player.score,
          gear: player.gear,
          level: player.level,
          modifiers: player.modifiers,
          isMale: player.isMale,
          isCursed: player.isCursed,
          temporaryModifier: player.temporaryModifier,
        );
      } else {
        // This is a new game - set default Munchkin starting values
        debugPrint('InitializeGameScreen: Setting default values for ${player.name}');
        return Player(
          name: player.name,
          id: player.id,
          score: 1, // Munchkin starts at level 1
          gear: 0,
          level: 1,
          modifiers: PlayerModifiers(),
          isMale: player.isMale,
          isCursed: false,
          temporaryModifier: 0,
        );
      }
    }).toList();

    emit(MunchkinGameState(
      players: initializedPlayers,
      isSinglePlayer: event.isSinglePlayer,
      history: [],
      redoHistory: [],
      isRestoredGame: false,
    ));
  }

  void _onIncreaseScore(
    IncreaseScore event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: updatedPlayers[event.playerIndex].score,
          newScore: updatedPlayers[event.playerIndex].score + 1,
          isIncrease: true,
          oldGear: updatedPlayers[event.playerIndex].gear,
          newGear: updatedPlayers[event.playerIndex].gear,
          oldLevel: updatedPlayers[event.playerIndex].level,
          newLevel: updatedPlayers[event.playerIndex].level,
        );

        updatedPlayers[event.playerIndex].score += 1;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
        ));

        // Save game after score change
        add(SaveGameSession());
      }
    }
  }

  void _onDecreaseScore(
    DecreaseScore event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        if (updatedPlayers[event.playerIndex].score > 0) {
          // Save current state to history before making changes
          final historyItem = ScoreHistoryItem(
            playerIndex: event.playerIndex,
            oldScore: updatedPlayers[event.playerIndex].score,
            newScore: updatedPlayers[event.playerIndex].score - 1,
            isIncrease: false,
            oldGear: updatedPlayers[event.playerIndex].gear,
            newGear: updatedPlayers[event.playerIndex].gear,
            oldLevel: updatedPlayers[event.playerIndex].level,
            newLevel: updatedPlayers[event.playerIndex].level,
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

  void _onIncreaseGear(
    IncreaseGear event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: updatedPlayers[event.playerIndex].score,
          newScore: updatedPlayers[event.playerIndex].score + 1,
          isIncrease: true,
          oldGear: updatedPlayers[event.playerIndex].gear,
          newGear: updatedPlayers[event.playerIndex].gear + 1,
          oldLevel: updatedPlayers[event.playerIndex].level,
          newLevel: updatedPlayers[event.playerIndex].level,
        );

        updatedPlayers[event.playerIndex].gear += 1;
        // Update total score based on gear + level
        updatedPlayers[event.playerIndex].score =
            updatedPlayers[event.playerIndex].gear +
                updatedPlayers[event.playerIndex].level;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
        ));

        // Save game after gear change
        add(SaveGameSession());
      }
    }
  }

  void _onDecreaseGear(
    DecreaseGear event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        if (updatedPlayers[event.playerIndex].gear > 0) {
          // Save current state to history before making changes
          final historyItem = ScoreHistoryItem(
            playerIndex: event.playerIndex,
            oldScore: updatedPlayers[event.playerIndex].score,
            newScore: updatedPlayers[event.playerIndex].score - 1,
            isIncrease: false,
            oldGear: updatedPlayers[event.playerIndex].gear,
            newGear: updatedPlayers[event.playerIndex].gear - 1,
            oldLevel: updatedPlayers[event.playerIndex].level,
            newLevel: updatedPlayers[event.playerIndex].level,
          );

          updatedPlayers[event.playerIndex].gear -= 1;
          // Update total score based on gear + level
          updatedPlayers[event.playerIndex].score =
              updatedPlayers[event.playerIndex].gear +
                  updatedPlayers[event.playerIndex].level;

          final updatedHistory =
              List<ScoreHistoryItem>.from(currentState.history)
                ..add(historyItem);

          emit(currentState.copyWith(
            players: updatedPlayers,
            history: updatedHistory,
            redoHistory: [], // Clear redo history on new action
          ));

          // Save game after gear change
          add(SaveGameSession());
        }
      }
    }
  }

  void _onIncreaseLevel(
    IncreaseLevel event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: updatedPlayers[event.playerIndex].score,
          newScore: updatedPlayers[event.playerIndex].score + 1,
          isIncrease: true,
          oldGear: updatedPlayers[event.playerIndex].gear,
          newGear: updatedPlayers[event.playerIndex].gear,
          oldLevel: updatedPlayers[event.playerIndex].level,
          newLevel: updatedPlayers[event.playerIndex].level + 1,
        );

        updatedPlayers[event.playerIndex].level += 1;
        // Update total score based on gear + level
        updatedPlayers[event.playerIndex].score =
            updatedPlayers[event.playerIndex].gear +
                updatedPlayers[event.playerIndex].level;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
        ));

        // Save game after level change
        add(SaveGameSession());
      }
    }
  }

  void _onDecreaseLevel(
    DecreaseLevel event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        if (updatedPlayers[event.playerIndex].level > 1) {
          // Level should not go below 1
          // Save current state to history before making changes
          final historyItem = ScoreHistoryItem(
            playerIndex: event.playerIndex,
            oldScore: updatedPlayers[event.playerIndex].score,
            newScore: updatedPlayers[event.playerIndex].score - 1,
            isIncrease: false,
            oldGear: updatedPlayers[event.playerIndex].gear,
            newGear: updatedPlayers[event.playerIndex].gear,
            oldLevel: updatedPlayers[event.playerIndex].level,
            newLevel: updatedPlayers[event.playerIndex].level - 1,
          );

          updatedPlayers[event.playerIndex].level -= 1;
          // Update total score based on gear + level
          updatedPlayers[event.playerIndex].score =
              updatedPlayers[event.playerIndex].gear +
                  updatedPlayers[event.playerIndex].level;

          final updatedHistory =
              List<ScoreHistoryItem>.from(currentState.history)
                ..add(historyItem);

          emit(currentState.copyWith(
            players: updatedPlayers,
            history: updatedHistory,
            redoHistory: [], // Clear redo history on new action
          ));

          // Save game after level change
          add(SaveGameSession());
        }
      }
    }
  }

  void _onResetScores(
    ResetScores event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      for (var i = 0; i < updatedPlayers.length; i++) {
        updatedPlayers[i].level = 1;
        updatedPlayers[i].gear = 0;
        updatedPlayers[i].score =
            updatedPlayers[i].gear + updatedPlayers[i].level;
        updatedPlayers[i].modifiers = PlayerModifiers();
        updatedPlayers[i].isCursed = false;
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

  void _onResetPlayerModifiers(
    ResetPlayerModifiers event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: updatedPlayers[event.playerIndex].score,
          newScore: updatedPlayers[event.playerIndex]
              .level, // New score will be just the level
          isIncrease: false,
          oldGear: updatedPlayers[event.playerIndex].gear,
          newGear: 0, // Gear will be reset to 0
          oldLevel: updatedPlayers[event.playerIndex].level,
          newLevel:
              updatedPlayers[event.playerIndex].level, // Level stays the same
        );

        // Reset gear to 0 according to Munchkin rules
        updatedPlayers[event.playerIndex].gear = 0;
        // Update total score based on gear + level
        updatedPlayers[event.playerIndex].score =
            updatedPlayers[event.playerIndex].level;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
        ));

        // Save game after resetting player modifiers
        add(SaveGameSession());
      }
    }
  }

  void _onUpdatePlayerModifier(
    UpdatePlayerModifier event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        final player = updatedPlayers[event.playerIndex];

        // Добавляем отладочную информацию
        debugPrint('Updating modifier for player ${event.playerIndex}');
        debugPrint('  Modifier type: ${event.modifierType}');
        debugPrint('  New value: ${event.value}');

        // Update the modifier based on the modifierType
        // Note: We use string constants here instead of S.current because case patterns must be constant expressions
        // These strings should match the keys in the localization files
        switch (event.modifierType) {
          case 'race1':
            player.modifiers = player.modifiers.copyWith(race1: event.value);
            break;
          case 'race2':
            player.modifiers = player.modifiers.copyWith(race2: event.value);
            break;
          case 'class1':
            player.modifiers = player.modifiers.copyWith(class1: event.value);
            break;
          case 'class2':
            player.modifiers = player.modifiers.copyWith(class2: event.value);
            break;
          case 'leftHand':
            player.modifiers = player.modifiers.copyWith(leftHand: event.value);
            break;
          case 'twoHanded':
            player.modifiers =
                player.modifiers.copyWith(twoHanded: event.value);
            break;
          case 'rightHand':
            player.modifiers =
                player.modifiers.copyWith(rightHand: event.value);
            break;
          case 'firstBonus':
            player.modifiers =
                player.modifiers.copyWith(firstBonus: event.value);
            break;
          case 'secondBonus':
            player.modifiers =
                player.modifiers.copyWith(secondBonus: event.value);
            break;
          case 'headGear':
            player.modifiers = player.modifiers.copyWith(headGear: event.value);
            break;
          case 'armour':
            player.modifiers = player.modifiers.copyWith(armour: event.value);
            break;
          case 'boots':
            player.modifiers = player.modifiers.copyWith(boots: event.value);
            break;
        }

        final newPlayers = updatedPlayers.map((player) => player).toList();

        emit(currentState.copyWith(
          players: newPlayers,
        ));

        // Save game after modifiers change
        add(SaveGameSession());
      }
    }
  }

  void _onTogglePlayerGender(
    TogglePlayerGender event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;

      final updatedPlayers = <Player>[];

      for (int i = 0; i < currentState.players.length; i++) {
        final originalPlayer = currentState.players[i];
        if (i == event.playerIndex) {
          final updatedPlayer = Player(
            name: originalPlayer.name,
            id: originalPlayer.id,
            score: originalPlayer.score,
            gear: originalPlayer.gear,
            level: originalPlayer.level,
            modifiers: originalPlayer.modifiers,
            isMale: !originalPlayer.isMale, // Инвертируем значение
            isCursed: originalPlayer.isCursed,
          );

          debugPrint(
              'Explicitly toggling gender for player ${event.playerIndex}');
          debugPrint(
              '  Original player gender: ${originalPlayer.isMale ? "Male" : "Female"}');
          debugPrint(
              '  Updated player gender: ${updatedPlayer.isMale ? "Male" : "Female"}');

          updatedPlayers.add(updatedPlayer);
        } else {
          updatedPlayers.add(originalPlayer);
        }
      }

      emit(currentState.copyWith(
        players: updatedPlayers,
      ));

      // Save game after gender change
      add(SaveGameSession());
    }
  }

  void _onTogglePlayerCursed(
    TogglePlayerCursed event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;

      final updatedPlayers = <Player>[];

      for (int i = 0; i < currentState.players.length; i++) {
        final originalPlayer = currentState.players[i];
        if (i == event.playerIndex) {
          final updatedPlayer = Player(
            name: originalPlayer.name,
            id: originalPlayer.id,
            score: originalPlayer.score,
            gear: originalPlayer.gear,
            level: originalPlayer.level,
            modifiers: originalPlayer.modifiers,
            isMale: originalPlayer.isMale,
            isCursed: !originalPlayer.isCursed,
          );

          debugPrint(
              'Explicitly toggling curse status for player ${event.playerIndex}');
          debugPrint('  Original player isCursed: ${originalPlayer.isCursed}');
          debugPrint('  Updated player isCursed: ${updatedPlayer.isCursed}');

          updatedPlayers.add(updatedPlayer);
        } else {
          updatedPlayers.add(originalPlayer);
        }
      }

      emit(currentState.copyWith(
        players: updatedPlayers,
      ));

      add(SaveGameSession());
    }
  }

  void _onUndoAction(
    UndoAction event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final currentPlayerIndex = event.playerIndex;

      // Find all history items for the current player
      final playerHistory = currentState.history
          .where((item) => item.playerIndex == currentPlayerIndex)
          .toList();

      if (playerHistory.isNotEmpty) {
        final updatedPlayers = List<Player>.from(currentState.players);
        // Get the last history item
        final historyItem = playerHistory.last;

        // Find the index of this item in the history
        final historyIndex = currentState.history
            .lastIndexWhere((item) => item.playerIndex == currentPlayerIndex);

        if (historyIndex != -1) {
          // Remove the last history item
          final updatedHistory =
              List<ScoreHistoryItem>.from(currentState.history);
          final removedItem = updatedHistory.removeAt(historyIndex);

          // Add the removed history item to the redo history
          final updatedRedoHistory =
              List<ScoreHistoryItem>.from(currentState.redoHistory)
                ..add(removedItem);

          final player = updatedPlayers[currentPlayerIndex];

          // Revert the score
          player.score = historyItem.oldScore;

          // Revert gear and level if available
          if (historyItem.oldGear != null) {
            player.gear = historyItem.oldGear!;
          }

          if (historyItem.oldLevel != null) {
            player.level = historyItem.oldLevel!;
          }

          // Revert temporary modifier if available
          if (historyItem.oldTemporaryModifier != null) {
            player.temporaryModifier = historyItem.oldTemporaryModifier!;
          }

          emit(currentState.copyWith(
            players: updatedPlayers,
            history: updatedHistory,
            redoHistory: updatedRedoHistory,
          ));

          // Save game after undo
          add(SaveGameSession());
        }
      }
    }
  }

  void _onRedoAction(
    RedoAction event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final currentPlayerIndex = event.playerIndex;

      // Find all redo history items for the current player
      final playerRedoHistory = currentState.redoHistory
          .where((item) => item.playerIndex == currentPlayerIndex)
          .toList();

      if (playerRedoHistory.isNotEmpty) {
        final updatedPlayers = List<Player>.from(currentState.players);
        // Get the last redo history item
        final redoItem = playerRedoHistory.last;

        // Find the index of this item in the redo history
        final redoIndex = currentState.redoHistory
            .lastIndexWhere((item) => item.playerIndex == currentPlayerIndex);

        if (redoIndex != -1) {
          // Remove the last redo history item
          final updatedRedoHistory =
              List<ScoreHistoryItem>.from(currentState.redoHistory);
          final removedRedoItem = updatedRedoHistory.removeAt(redoIndex);

          // Add the removed redo history item to the history
          final updatedHistory =
              List<ScoreHistoryItem>.from(currentState.history)
                ..add(removedRedoItem);

          final player = updatedPlayers[currentPlayerIndex];

          // Apply the score change
          player.score = redoItem.newScore;

          // Apply gear and level changes if available
          if (redoItem.newGear != null) {
            player.gear = redoItem.newGear!;
          }

          if (redoItem.newLevel != null) {
            player.level = redoItem.newLevel!;
          }

          // Apply temporary modifier changes if available
          if (redoItem.newTemporaryModifier != null) {
            player.temporaryModifier = redoItem.newTemporaryModifier!;
          }

          emit(currentState.copyWith(
            players: updatedPlayers,
            history: updatedHistory,
            redoHistory: updatedRedoHistory,
          ));

          // Save game after redo
          add(SaveGameSession());
        }
      }
    }
  }

  // Temporary modifier event handlers
  void _onAddTemporaryModifier(
    AddTemporaryModifier event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        final player = updatedPlayers[event.playerIndex];

        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: player.score,
          newScore:
              player.score, // Score doesn't change, only temporary modifier
          isIncrease: true,
          oldGear: player.gear,
          newGear: player.gear,
          oldLevel: player.level,
          newLevel: player.level,
          oldTemporaryModifier: player.temporaryModifier,
          newTemporaryModifier: player.temporaryModifier + event.modifierValue,
        );

        // Add the modifier value to the temporary modifier
        player.temporaryModifier += event.modifierValue;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
        ));

        // Save game after temporary modifier change
        add(SaveGameSession());
      }
    }
  }

  void _onClearTemporaryModifiers(
    ClearTemporaryModifiers event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        final player = updatedPlayers[event.playerIndex];

        // Save current state to history before making changes
        final historyItem = ScoreHistoryItem(
          playerIndex: event.playerIndex,
          oldScore: player.score,
          newScore:
              player.score, // Score doesn't change, only temporary modifier
          isIncrease: false,
          oldGear: player.gear,
          newGear: player.gear,
          oldLevel: player.level,
          newLevel: player.level,
          oldTemporaryModifier: player.temporaryModifier,
          newTemporaryModifier: 0,
        );

        // Clear the temporary modifier for the specific player
        player.temporaryModifier = 0;

        final updatedHistory = List<ScoreHistoryItem>.from(currentState.history)
          ..add(historyItem);

        emit(currentState.copyWith(
          players: updatedPlayers,
          history: updatedHistory,
          redoHistory: [], // Clear redo history on new action
        ));

        // Save game after clearing temporary modifiers
        add(SaveGameSession());
      }
    }
  }

  // Database-related event handlers
  void _onCheckSavedGame(
    CheckSavedGame event,
    Emitter<MunchkinState> emit,
  ) async {
    if (state is MunchkinStartScreenState) {
      final currentState = state as MunchkinStartScreenState;
      final hasSavedGame = await DatabaseService.hasGameSession('munchkin');
      emit(currentState.copyWith(hasSavedGame: hasSavedGame));
    }
  }

  void _onLoadSavedGame(
    LoadSavedGame event,
    Emitter<MunchkinState> emit,
  ) async {
    final gameData = await DatabaseService.getLatestGameSession('munchkin');

    if (gameData != null) {
      final session = gameData['session'] as Map<String, dynamic>;
      final players = gameData['players'] as List<Player>;

      debugPrint('Loading Munchkin saved game:');
      debugPrint('Game mode: ${session['game_mode']}');
      debugPrint('Players count: ${players.length}');

      // Extract custom data from the session
      Map<String, dynamic> customData = {};
      if (session.containsKey('custom_data') &&
          session['custom_data'] != null) {
        try {
          // The custom_data is stored as a JSON string, so we need to decode it
          final customDataString = session['custom_data'] as String;
          customData = jsonDecode(customDataString) as Map<String, dynamic>;
          debugPrint('Custom data loaded successfully');
          debugPrint('Is single player: ${customData['is_single_player']}');
        } catch (e) {
          debugPrint('Error parsing custom data: $e');
        }
      }

      // Restore player-specific fields from custom data
      for (int i = 0; i < players.length; i++) {
        if (customData.containsKey('player_$i')) {
          final playerData = customData['player_$i'] as Map<String, dynamic>;

          // Restore player properties
          players[i].level = playerData['level'] as int? ?? 1;
          players[i].gear = playerData['gear'] as int? ?? 0;
          players[i].isMale = playerData['is_male'] as bool? ?? true;
          players[i].isCursed = playerData['is_cursed'] as bool? ?? false;
          players[i].temporaryModifier =
              playerData['temporary_modifier'] as int? ?? 0;

          // Recalculate score based on level and gear for Munchkin
          players[i].score = players[i].level + players[i].gear;

          debugPrint('Restored player $i: ${players[i].name}');
          debugPrint('  Score recalculated: ${players[i].score} (level: ${players[i].level} + gear: ${players[i].gear})');
          debugPrint('  Level: ${players[i].level}, Gear: ${players[i].gear}');
          debugPrint('  Temporary Modifier: ${players[i].temporaryModifier}');
          debugPrint(
              '  Gender: ${players[i].isMale ? "Male" : "Female"}, Cursed: ${players[i].isCursed}');

          // Restore player modifiers
          if (playerData.containsKey('modifiers')) {
            final modifiersData =
                playerData['modifiers'] as Map<String, dynamic>;
            players[i].modifiers = PlayerModifiers(
              race1: modifiersData['race1'] as String?,
              race2: modifiersData['race2'] as String?,
              class1: modifiersData['class1'] as String?,
              class2: modifiersData['class2'] as String?,
              leftHand: modifiersData['leftHand'] as String?,
              twoHanded: modifiersData['twoHanded'] as String?,
              rightHand: modifiersData['rightHand'] as String?,
              firstBonus: modifiersData['firstBonus'] as String?,
              secondBonus: modifiersData['secondBonus'] as String?,
              headGear: modifiersData['headGear'] as String?,
              armour: modifiersData['armour'] as String?,
              boots: modifiersData['boots'] as String?,
            );

            debugPrint('  Modifiers restored');
          }
        }
      }

      final isSinglePlayer = customData['is_single_player'] as bool? ?? false;

      // Emit game state
      emit(MunchkinGameState(
        players: players,
        isSinglePlayer: isSinglePlayer,
        history: [], // Start with empty history for the loaded game
        redoHistory: [], // Start with empty redo history for the loaded game
        isRestoredGame: true,
      ));

      // Notify that the game has been loaded with these specific details
      add(GameLoaded(
        players: players,
        isSinglePlayer: isSinglePlayer,
      ));
    }
  }

  void _onGameLoaded(
    GameLoaded event,
    Emitter<MunchkinState> emit,
  ) {
    // This handler allows listeners to react to the successful loading of a game
    // The state has already been updated in _onLoadSavedGame, so no need to emit here
  }

  void _onDeleteSavedGame(
    DeleteSavedGame event,
    Emitter<MunchkinState> emit,
  ) async {
    await DatabaseService.deleteGameSession('munchkin');

    if (state is MunchkinStartScreenState) {
      final currentState = state as MunchkinStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  void _onSaveGameSession(
    SaveGameSession event,
    Emitter<MunchkinState> emit,
  ) async {
    if (state is MunchkinGameState) {
      final gameState = state as MunchkinGameState;

      try {
        // Delete any existing Munchkin game sessions first
        await DatabaseService.deleteGameSession('munchkin');

        // Create custom data for saving player-specific fields
        final Map<String, dynamic> customData = {
          'is_single_player': gameState.isSinglePlayer,
        };

        debugPrint('Saving Munchkin game:');
        debugPrint('Player count: ${gameState.players.length}');
        debugPrint('Is single player: ${gameState.isSinglePlayer}');

        // Save player-specific fields
        for (int i = 0; i < gameState.players.length; i++) {
          final player = gameState.players[i];

          // Create a map for modifiers
          final Map<String, dynamic> modifiersMap = {
            'race1': player.modifiers.race1,
            'race2': player.modifiers.race2,
            'class1': player.modifiers.class1,
            'class2': player.modifiers.class2,
            'leftHand': player.modifiers.leftHand,
            'twoHanded': player.modifiers.twoHanded,
            'rightHand': player.modifiers.rightHand,
            'firstBonus': player.modifiers.firstBonus,
            'secondBonus': player.modifiers.secondBonus,
            'headGear': player.modifiers.headGear,
            'armour': player.modifiers.armour,
            'boots': player.modifiers.boots,
          };

          // Store player data in the custom data
          customData['player_$i'] = {
            'level': player.level,
            'gear': player.gear,
            'is_male': player.isMale,
            'is_cursed': player.isCursed,
            'temporary_modifier': player.temporaryModifier,
            'modifiers': modifiersMap,
          };

          debugPrint(
              'Saving player $i: ${player.name} (level: ${player.level}, gear: ${player.gear}, temp_modifier: ${player.temporaryModifier})');
        }

        // Create player score history map
        Map<int, List<int>> playerScoreHistory = {};
        for (int i = 0; i < gameState.players.length; i++) {
          playerScoreHistory[i] = [];
        }

        // Save the current game session
        await DatabaseService.saveGameSession(
          gameType: 'munchkin',
          scoreLimit: 10, // Default for Munchkin
          gameMode: gameState.isSinglePlayer ? 'singleplayer' : 'multiplayer',
          players: gameState.players,
          playerScoreHistory: playerScoreHistory,
          customData: customData,
        );
      } catch (e) {
        debugPrint('Error saving Munchkin game session: $e');
      }
    }
  }
}
