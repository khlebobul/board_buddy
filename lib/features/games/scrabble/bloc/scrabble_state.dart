part of 'scrabble_bloc.dart';

@immutable
sealed class ScrabbleState {}

final class ScrabbleInitial extends ScrabbleState {}

final class ScrabbleStartScreenState extends ScrabbleState {
  final List<Player> players;

  ScrabbleStartScreenState({
    required this.players,
  });

  ScrabbleStartScreenState copyWith({
    List<Player>? players,
  }) {
    return ScrabbleStartScreenState(
      players: players ?? this.players,
    );
  }
}
