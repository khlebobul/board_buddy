import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:board_buddy/shared/models/player_model.dart';

part 'carcassonne_event.dart';
part 'carcassonne_state.dart';

class CarcassonneBloc extends Bloc<CarcassonneEvent, CarcassonneState> {
  CarcassonneBloc() : super(CarcassonneInitial()) {
    on<InitializeCarcassonneStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
  }

  void _onInitializeStartScreen(
    InitializeCarcassonneStartScreen event,
    Emitter<CarcassonneState> emit,
  ) {
    emit(CarcassonneStartScreenState(
      selectedMode: S.current.manual,
      isAutomatic: false,
      players: [],
    ));
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      final isAutomatic = event.mode == S.current.automatic;

      emit(currentState.copyWith(
        selectedMode: event.mode,
        isAutomatic: isAutomatic,
        players: isAutomatic ? [] : currentState.players,
      ));
    }
  }

  void _onAddPlayer(
    AddPlayer event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      if (!currentState.isAutomatic) {
        final players = List<Player>.from(currentState.players);
        players.add(event.player);
        emit(currentState.copyWith(players: players));
      }
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      if (!currentState.isAutomatic) {
        final players = List<Player>.from(currentState.players);
        players.removeAt(event.index);
        emit(currentState.copyWith(players: players));
      }
    }
  }
}
