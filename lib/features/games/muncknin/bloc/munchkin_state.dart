part of 'munchkin_bloc.dart';

@immutable
sealed class MunchkinState {}

final class MunchkinInitial extends MunchkinState {}

class MunchkinStartScreenState extends MunchkinState {
  final List<Player> players;
  final String selectedMode;
  final bool isSinglePlayer;

  MunchkinStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.isSinglePlayer,
  });

  MunchkinStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    bool? isSinglePlayer,
  }) {
    return MunchkinStartScreenState(
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
  final int? oldGear;
  final int? newGear;
  final int? oldLevel;
  final int? newLevel;

  ScoreHistoryItem({
    required this.playerIndex,
    required this.oldScore,
    required this.newScore,
    required this.isIncrease,
    this.oldGear,
    this.newGear,
    this.oldLevel,
    this.newLevel,
  });
}

class MunchkinGameState extends MunchkinState {
  final List<Player> players;
  final bool isSinglePlayer;
  final List<ScoreHistoryItem> history;
  final List<ScoreHistoryItem> redoHistory;

  MunchkinGameState({
    required this.players,
    required this.isSinglePlayer,
    this.history = const [],
    this.redoHistory = const [],
  });

  MunchkinGameState copyWith({
    List<Player>? players,
    bool? isSinglePlayer,
    List<ScoreHistoryItem>? history,
    List<ScoreHistoryItem>? redoHistory,
  }) {
    return MunchkinGameState(
      players: players ?? this.players,
      isSinglePlayer: isSinglePlayer ?? this.isSinglePlayer,
      history: history ?? this.history,
      redoHistory: redoHistory ?? this.redoHistory,
    );
  }
}
