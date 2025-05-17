import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'carcassonne_event.dart';
part 'carcassonne_state.dart';

class CarcassonneBloc extends Bloc<CarcassonneEvent, CarcassonneState> {
  CarcassonneBloc() : super(CarcassonneInitial()) {
    on<InitializeCarcassonneStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
  }

  void _onInitializeStartScreen(
    InitializeCarcassonneStartScreen event,
    Emitter<CarcassonneState> emit,
  ) {
    emit(CarcassonneStartScreenState(
      selectedMode: 'Manual',
      isAutomatic: false,
    ));
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<CarcassonneState> emit,
  ) {
    if (state is CarcassonneStartScreenState) {
      final currentState = state as CarcassonneStartScreenState;
      final isAutomatic = event.mode.toLowerCase() == 'automatic';

      emit(currentState.copyWith(
        selectedMode: event.mode,
        isAutomatic: isAutomatic,
      ));
    }
  }
}
