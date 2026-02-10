import 'package:bloc/bloc.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:flutter/material.dart';

part 'sea_salt_paper_event.dart';
part 'sea_salt_paper_state.dart';

class SeaSaltPaperBloc extends Bloc<SeaSaltPaperEvent, SeaSaltPaperState> {
  SeaSaltPaperBloc() : super(SeaSaltPaperInitial()) {
    on<InitializeSeaSaltPaperStartScreen>(_onInitializeStartScreen);
    on<AddSeaSaltPaperPlayer>(_onAddPlayer);
    on<RemoveSeaSaltPaperPlayer>(_onRemovePlayer);
    on<CheckSavedSeaSaltPaperGame>(_onCheckSavedGame);
    on<LoadSavedSeaSaltPaperGame>(_onLoadSavedGame);
    on<DeleteSavedSeaSaltPaperGame>(_onDeleteSavedGame);
    on<UpdateSeaSaltPaperScoreLimit>(_onUpdateScoreLimit);
  }

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
      // TODO: Implement saved game check when game screen is ready
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  void _onLoadSavedGame(
    LoadSavedSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) async {
    // TODO: Implement load saved game when game screen is ready
  }

  void _onDeleteSavedGame(
    DeleteSavedSeaSaltPaperGame event,
    Emitter<SeaSaltPaperState> emit,
  ) async {
    // TODO: Implement delete saved game when game screen is ready
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
}
