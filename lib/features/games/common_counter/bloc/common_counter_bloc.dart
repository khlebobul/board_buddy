import 'package:bloc/bloc.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:meta/meta.dart';

part 'common_counter_event.dart';
part 'common_counter_state.dart';

class CommonCounterBloc extends Bloc<CommonCounterEvent, CommonCounterState> {
  CommonCounterBloc() : super(CommonCounterInitial()) {
    on<InitializeCommonCounterStartScreen>(_onInitializeStartScreen);
    on<SelectGameMode>(_onSelectGameMode);
    on<AddPlayer>(_onAddPlayer);
    on<RemovePlayer>(_onRemovePlayer);
  }

  void _onInitializeStartScreen(
    InitializeCommonCounterStartScreen event,
    Emitter<CommonCounterState> emit,
  ) {
    emit(CommonCounterStartScreenState(
      players: [],
      selectedMode: "multiplayer",
      isSinglePlayer: false,
    ));
  }

  void _onSelectGameMode(
    SelectGameMode event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
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
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players)
        ..add(event.player);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onRemovePlayer(
    RemovePlayer event,
    Emitter<CommonCounterState> emit,
  ) {
    if (state is CommonCounterStartScreenState) {
      final currentState = state as CommonCounterStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      if (event.index >= 0 && event.index < updatedPlayers.length) {
        updatedPlayers.removeAt(event.index);
      }
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }
}
