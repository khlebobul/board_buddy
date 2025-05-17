part of 'carcassonne_bloc.dart';

@immutable
abstract class CarcassonneState {}

class CarcassonneInitial extends CarcassonneState {}

class CarcassonneStartScreenState extends CarcassonneState {
  final String selectedMode;
  final bool isAutomatic;
  final List<Player> players;

  CarcassonneStartScreenState({
    required this.selectedMode,
    required this.isAutomatic,
    this.players = const [],
  });

  CarcassonneStartScreenState copyWith({
    String? selectedMode,
    bool? isAutomatic,
    List<Player>? players,
  }) {
    return CarcassonneStartScreenState(
      selectedMode: selectedMode ?? this.selectedMode,
      isAutomatic: isAutomatic ?? this.isAutomatic,
      players: players ?? this.players,
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

class CarcassonneGameState extends CarcassonneState {
  final bool isAutomatic;
  final List<Player> players;
  final List<ScoreHistoryItem> history;
  final List<ScoreHistoryItem> redoHistory;

  CarcassonneGameState({
    required this.isAutomatic,
    this.players = const [],
    this.history = const [],
    this.redoHistory = const [],
  });

  CarcassonneGameState copyWith({
    bool? isAutomatic,
    List<Player>? players,
    List<ScoreHistoryItem>? history,
    List<ScoreHistoryItem>? redoHistory,
  }) {
    return CarcassonneGameState(
      isAutomatic: isAutomatic ?? this.isAutomatic,
      players: players ?? this.players,
      history: history ?? this.history,
      redoHistory: redoHistory ?? this.redoHistory,
    );
  }
}
