part of 'set_bloc.dart';

@immutable
abstract class SetState {}

final class SetInitial extends SetState {}

class SetStartScreenState extends SetState {
  final List<Player> players;
  final String selectedMode;
  final bool isSinglePlayer;
  final int scoreLimit;

  SetStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.isSinglePlayer,
    this.scoreLimit = 30,
  });

  SetStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    bool? isSinglePlayer,
    int? scoreLimit,
  }) {
    return SetStartScreenState(
      players: players ?? this.players,
      selectedMode: selectedMode ?? this.selectedMode,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
      scoreLimit: scoreLimit ?? this.scoreLimit,
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

class SetGameState extends SetState {
  final List<Player> players;
  final bool isSinglePlayer;
  final int scoreLimit;
  final List<ScoreHistoryItem> history;
  final List<ScoreHistoryItem> redoHistory;

  SetGameState({
    required this.players,
    required this.isSinglePlayer,
    required this.scoreLimit,
    this.history = const [],
    this.redoHistory = const [],
  });

  SetGameState copyWith({
    List<Player>? players,
    bool? isSinglePlayer,
    int? scoreLimit,
    List<ScoreHistoryItem>? history,
    List<ScoreHistoryItem>? redoHistory,
  }) {
    return SetGameState(
      players: players ?? this.players,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      history: history ?? this.history,
      redoHistory: redoHistory ?? this.redoHistory,
    );
  }
}
