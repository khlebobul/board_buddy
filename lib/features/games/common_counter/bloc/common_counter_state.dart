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

class ScoreHistoryItem {
  final int playerIndex;
  final int oldScore;
  final int newScore;
  final bool isIncrease;

  ScoreHistoryItem({
    required this.playerIndex,
    required this.oldScore,
    required this.newScore,
    required this.isIncrease,
  });
}

class CommonCounterGameState extends CommonCounterState {
  final List<Player> players;
  final bool isSinglePlayer;
  final List<ScoreHistoryItem> history;
  final List<ScoreHistoryItem> redoHistory;

  CommonCounterGameState({
    required this.players,
    required this.isSinglePlayer,
    this.history = const [],
    this.redoHistory = const [],
  });

  CommonCounterGameState copyWith({
    List<Player>? players,
    bool? isSinglePlayer,
    List<ScoreHistoryItem>? history,
    List<ScoreHistoryItem>? redoHistory,
  }) {
    return CommonCounterGameState(
      players: players ?? this.players,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
      history: history ?? this.history,
      redoHistory: redoHistory ?? this.redoHistory,
    );
  }
}
