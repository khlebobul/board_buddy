part of 'set_bloc.dart';

@immutable
abstract class SetState {}

final class SetInitial extends SetState {}

class SetStartScreenState extends SetState {
  final List<Player> players;
  final String selectedMode;
  final bool isSinglePlayer;
  final bool hasSavedGame;

  SetStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.isSinglePlayer,
    this.hasSavedGame = false,
  });

  SetStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    bool? isSinglePlayer,
    bool? hasSavedGame,
  }) {
    return SetStartScreenState(
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

class SetGameState extends SetState {
  final List<Player> players;
  final bool isSinglePlayer;
  final List<ScoreHistoryItem> history;
  final List<ScoreHistoryItem> redoHistory;
  final int timerSeconds;

  SetGameState({
    required this.players,
    required this.isSinglePlayer,
    this.history = const [],
    this.redoHistory = const [],
    this.timerSeconds = 0,
  });

  SetGameState copyWith({
    List<Player>? players,
    bool? isSinglePlayer,
    List<ScoreHistoryItem>? history,
    List<ScoreHistoryItem>? redoHistory,
    int? timerSeconds,
  }) {
    return SetGameState(
      players: players ?? this.players,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
      history: history ?? this.history,
      redoHistory: redoHistory ?? this.redoHistory,
      timerSeconds: timerSeconds ?? this.timerSeconds,
    );
  }
}
