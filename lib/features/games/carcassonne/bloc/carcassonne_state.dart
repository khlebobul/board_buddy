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

class CarcassonneGameState extends CarcassonneState {
  final bool isAutomatic;
  final List<Player> players;
  final int score;

  CarcassonneGameState({
    required this.isAutomatic,
    this.players = const [],
    this.score = 0,
  });

  CarcassonneGameState copyWith({
    bool? isAutomatic,
    List<Player>? players,
    int? score,
  }) {
    return CarcassonneGameState(
      isAutomatic: isAutomatic ?? this.isAutomatic,
      players: players ?? this.players,
      score: score ?? this.score,
    );
  }
}
