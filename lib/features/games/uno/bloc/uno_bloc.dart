import 'package:bloc/bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:meta/meta.dart';

part 'uno_event.dart';
part 'uno_state.dart';

class UnoBloc extends Bloc<UnoEvent, UnoState> {
  UnoBloc() : super(UnoInitial()) {
    on<InitializeUnoStartScreen>(_onInitializeUnoStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<UpdateScoreLimit>(_onUpdateScoreLimit);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
  }

  void _onInitializeUnoStartScreen(
    InitializeUnoStartScreen event,
    Emitter<UnoState> emit,
  ) {
    emit(UnoStartScreenState(
      players: [],
      selectedMode: S.current.highestScoreWins,
      scoreLimit: 500,
    ));
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
      final updatedPlayers = List<Player>.from(currentState.players)..add(event.player);
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
}
