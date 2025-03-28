part of 'common_counter_bloc.dart';

@immutable
abstract class CommonCounterState {}

final class CommonCounterInitial extends CommonCounterState {}

class CommonCounterStartScreenState extends CommonCounterState {
  final List<Player> players;
  final String selectedMode;
  final bool isSinglePlayer;
  final bool hasSavedGame;

  CommonCounterStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.isSinglePlayer,
    this.hasSavedGame = false,
  });

  CommonCounterStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    bool? isSinglePlayer,
    bool? hasSavedGame,
  }) {
    return CommonCounterStartScreenState(
      players: players ?? this.players,
      selectedMode: selectedMode ?? this.selectedMode,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
      hasSavedGame: hasSavedGame ?? this.hasSavedGame,
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
  final bool isScoreChanging;
  final int lastScoreChange;

  CommonCounterGameState({
    required this.players,
    required this.isSinglePlayer,
    this.history = const [],
    this.redoHistory = const [],
    this.isScoreChanging = false,
    this.lastScoreChange = 0,
  });

  CommonCounterGameState copyWith({
    List<Player>? players,
    bool? isSinglePlayer,
    List<ScoreHistoryItem>? history,
    List<ScoreHistoryItem>? redoHistory,
    bool? isScoreChanging,
    int? lastScoreChange,
  }) {
    return CommonCounterGameState(
      players: players ?? this.players,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
      history: history ?? this.history,
      redoHistory: redoHistory ?? this.redoHistory,
      isScoreChanging: isScoreChanging ?? this.isScoreChanging,
      lastScoreChange: lastScoreChange ?? this.lastScoreChange,
    );
  }
}
