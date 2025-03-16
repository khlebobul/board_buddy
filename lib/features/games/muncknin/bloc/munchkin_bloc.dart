import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:meta/meta.dart';

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
    emit(MunchkinGameState(
      players: List.from(event.players),
      isSinglePlayer: event.isSinglePlayer,
      history: [],
      redoHistory: [],
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
        updatedPlayers[i].score = 0;
      }

      emit(currentState.copyWith(
        players: updatedPlayers,
        history: [], // Clear history on reset
        redoHistory: [], // Clear redo history on reset
      ));
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

        emit(currentState.copyWith(
          players: updatedPlayers,
        ));
      }
    }
  }

  void _onTogglePlayerGender(
    TogglePlayerGender event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        updatedPlayers[event.playerIndex].isMale =
            !updatedPlayers[event.playerIndex].isMale;

        emit(currentState.copyWith(
          players: updatedPlayers,
        ));
      }
    }
  }

  void _onTogglePlayerCursed(
    TogglePlayerCursed event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;
      final updatedPlayers = List<Player>.from(currentState.players);

      if (event.playerIndex >= 0 && event.playerIndex < updatedPlayers.length) {
        updatedPlayers[event.playerIndex].isCursed =
            !updatedPlayers[event.playerIndex].isCursed;

        emit(currentState.copyWith(
          players: updatedPlayers,
        ));
      }
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

          emit(currentState.copyWith(
            players: updatedPlayers,
            history: updatedHistory,
            redoHistory: updatedRedoHistory,
          ));
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

          emit(currentState.copyWith(
            players: updatedPlayers,
            history: updatedHistory,
            redoHistory: updatedRedoHistory,
          ));
        }
      }
    }
  }
}
