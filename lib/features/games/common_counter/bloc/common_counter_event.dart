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

// Database-related events
class CheckSavedGame extends CommonCounterEvent {}

class LoadSavedGame extends CommonCounterEvent {}

class DeleteSavedGame extends CommonCounterEvent {}

class SaveGameSession extends CommonCounterEvent {}

class SaveTimerValue extends CommonCounterEvent {
  final int seconds;

  SaveTimerValue(this.seconds);
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

class IncreaseScoreBy extends CommonCounterEvent {
  final int playerIndex;
  final int amount;

  IncreaseScoreBy(this.playerIndex, this.amount);
}

class DecreaseScoreBy extends CommonCounterEvent {
  final int playerIndex;
  final int amount;

  DecreaseScoreBy(this.playerIndex, this.amount);
}

class ResetScores extends CommonCounterEvent {}

class UpdateTimer extends CommonCounterEvent {
  final int seconds;

  UpdateTimer(this.seconds);
}

// Undo/Redo events
class UndoAction extends CommonCounterEvent {}

class RedoAction extends CommonCounterEvent {}

class ResetScoreAnimation extends CommonCounterEvent {}
