part of 'scrabble_bloc.dart';

@immutable
sealed class ScrabbleState {}

final class ScrabbleInitial extends ScrabbleState {}

final class ScrabbleStartScreenState extends ScrabbleState {
  final List<Player> players;
  final bool hasSavedGame;

  ScrabbleStartScreenState({
    required this.players,
    this.hasSavedGame = false,
  });

  ScrabbleStartScreenState copyWith({
    List<Player>? players,
    bool? hasSavedGame,
  }) {
    return ScrabbleStartScreenState(
      players: players ?? this.players,
      hasSavedGame: hasSavedGame ?? this.hasSavedGame,
    );
  }
}

final class ScrabbleGameState extends ScrabbleState {
  final List<Player> players;
  final int currentPlayerIndex;
  final List<Map<String, dynamic>> moveHistory;

  ScrabbleGameState({
    required this.players,
    this.currentPlayerIndex = 0,
    this.moveHistory = const [],
  });

  ScrabbleGameState copyWith({
    List<Player>? players,
    int? currentPlayerIndex,
    List<Map<String, dynamic>>? moveHistory,
  }) {
    return ScrabbleGameState(
      players: players ?? this.players,
      currentPlayerIndex: currentPlayerIndex ?? this.currentPlayerIndex,
      moveHistory: moveHistory ?? this.moveHistory,
    );
  }
}
