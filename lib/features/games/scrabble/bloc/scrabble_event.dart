part of 'scrabble_bloc.dart';

@immutable
sealed class ScrabbleEvent {}

final class InitializeScrabbleStartScreen extends ScrabbleEvent {}

final class AddPlayer extends ScrabbleEvent {
  final Player player;

  AddPlayer(this.player);
}

final class RemovePlayer extends ScrabbleEvent {
  final int index;

  RemovePlayer(this.index);
}

// Database-related events
final class CheckSavedGame extends ScrabbleEvent {}

final class LoadSavedGame extends ScrabbleEvent {}

final class DeleteSavedGame extends ScrabbleEvent {}

final class SaveGameSession extends ScrabbleEvent {}

// Game-related events
final class InitializeScrabbleGame extends ScrabbleEvent {
  final List<Player> players;

  InitializeScrabbleGame({
    required this.players,
  });
}

final class SubmitWord extends ScrabbleEvent {
  final String word;
  final int score;
  final Player player;
  final Map<String, dynamic>? modifiers;

  SubmitWord({
    required this.word,
    required this.score,
    required this.player,
    this.modifiers,
  });
}

final class SkipTurn extends ScrabbleEvent {
  final Player player;

  SkipTurn({
    required this.player,
  });
}

final class NextPlayer extends ScrabbleEvent {}

final class ResetGame extends ScrabbleEvent {
  final bool keepPlayers;

  ResetGame({
    this.keepPlayers = false,
  });
}
