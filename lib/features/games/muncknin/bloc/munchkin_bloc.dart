import 'package:bloc/bloc.dart';
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
    on<ResetScores>(_onResetScores);
    on<UndoAction>(_onUndoAction);
    on<RedoAction>(_onRedoAction);
  }

  void _onInitializeStartScreen(
    InitializeMunchkinStartScreen event,
    Emitter<MunchkinState> emit,
  ) {
    emit(MunchkinStartScreenState(
      players: [],
      selectedMode: "multiplayer",
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
      final isSinglePlayer =
          lowerCaseMode.contains("single") || lowerCaseMode == "singleplayer";

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

  void _onUndoAction(
    UndoAction event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;

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
      }
    }
  }

  void _onRedoAction(
    RedoAction event,
    Emitter<MunchkinState> emit,
  ) {
    if (state is MunchkinGameState) {
      final currentState = state as MunchkinGameState;

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
}
