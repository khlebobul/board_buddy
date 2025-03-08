part of 'common_counter_bloc.dart';

@immutable
abstract class CommonCounterState {}

final class CommonCounterInitial extends CommonCounterState {}

class CommonCounterStartScreenState extends CommonCounterState {
  final List<Player> players;
  final String selectedMode;
  final bool isSinglePlayer;

  CommonCounterStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.isSinglePlayer,
  });

  CommonCounterStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    bool? isSinglePlayer,
  }) {
    return CommonCounterStartScreenState(
      players: players ?? this.players,
      selectedMode: selectedMode ?? this.selectedMode,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
    );
  }
}

class CommonCounterGameState extends CommonCounterState {
  final List<Player> players;
  final bool isSinglePlayer;

  CommonCounterGameState({
    required this.players,
    required this.isSinglePlayer,
  });

  CommonCounterGameState copyWith({
    List<Player>? players,
    bool? isSinglePlayer,
  }) {
    return CommonCounterGameState(
      players: players ?? this.players,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
    );
  }
}
