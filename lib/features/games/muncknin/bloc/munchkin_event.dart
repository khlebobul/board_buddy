part of 'munchkin_bloc.dart';

@immutable
sealed class MunchkinEvent {}

class InitializeMunchkinStartScreen extends MunchkinEvent {}

class SelectGameMode extends MunchkinEvent {
  final String mode;
  SelectGameMode(this.mode);
}

class AddPlayer extends MunchkinEvent {
  final Player player;
  AddPlayer(this.player);
}

class RemovePlayer extends MunchkinEvent {
  final int index;
  RemovePlayer(this.index);
}

// Game screen events
class InitializeGameScreen extends MunchkinEvent {
  final List<Player> players;
  final bool isSinglePlayer;

  InitializeGameScreen({
    required this.players,
    required this.isSinglePlayer,
  });
}

class IncreaseScore extends MunchkinEvent {
  final int playerIndex;

  IncreaseScore(this.playerIndex);
}

class DecreaseScore extends MunchkinEvent {
  final int playerIndex;

  DecreaseScore(this.playerIndex);
}

class ResetScores extends MunchkinEvent {}

// Undo/Redo events
class UndoAction extends MunchkinEvent {}

class RedoAction extends MunchkinEvent {}
