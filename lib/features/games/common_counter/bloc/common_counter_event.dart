part of 'common_counter_bloc.dart';

@immutable
abstract class CommonCounterEvent {}

class InitializeCommonCounterStartScreen extends CommonCounterEvent {}

class SelectGameMode extends CommonCounterEvent {
  final String mode;
  SelectGameMode(this.mode);
}

class AddPlayer extends CommonCounterEvent {
  final Player player;
  AddPlayer(this.player);
}

class RemovePlayer extends CommonCounterEvent {
  final int index;
  RemovePlayer(this.index);
}

// Game screen events
class InitializeGameScreen extends CommonCounterEvent {
  final List<Player> players;
  final bool isSinglePlayer;

  InitializeGameScreen({
    required this.players,
    required this.isSinglePlayer,
  });
}

class IncreaseScore extends CommonCounterEvent {
  final int playerIndex;

  IncreaseScore(this.playerIndex);
}

class DecreaseScore extends CommonCounterEvent {
  final int playerIndex;

  DecreaseScore(this.playerIndex);
}

class ResetScores extends CommonCounterEvent {}

// Undo/Redo events
class UndoAction extends CommonCounterEvent {}

class RedoAction extends CommonCounterEvent {}
