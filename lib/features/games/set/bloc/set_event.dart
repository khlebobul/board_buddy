part of 'set_bloc.dart';

@immutable
abstract class SetEvent {}

class InitializeSetStartScreen extends SetEvent {}

class SelectGameMode extends SetEvent {
  final String mode;
  SelectGameMode(this.mode);
}

class AddPlayer extends SetEvent {
  final Player player;
  AddPlayer(this.player);
}

class RemovePlayer extends SetEvent {
  final int index;
  RemovePlayer(this.index);
}

// Database-related events
class CheckSavedGame extends SetEvent {}

class LoadSavedGame extends SetEvent {}

class DeleteSavedGame extends SetEvent {}

class SaveGameSession extends SetEvent {}

class SaveTimerValue extends SetEvent {
  final int seconds;

  SaveTimerValue(this.seconds);
}

// Game screen events
class InitializeGameScreen extends SetEvent {
  final List<Player> players;
  final bool isSinglePlayer;

  InitializeGameScreen({
    required this.players,
    required this.isSinglePlayer,
  });
}

class IncreaseScore extends SetEvent {
  final int playerIndex;

  IncreaseScore(this.playerIndex);
}

class DecreaseScore extends SetEvent {
  final int playerIndex;

  DecreaseScore(this.playerIndex);
}

class ResetScores extends SetEvent {}

class UpdateTimer extends SetEvent {
  final int seconds;

  UpdateTimer(this.seconds);
}

// Undo/Redo events
class UndoAction extends SetEvent {}

class RedoAction extends SetEvent {}
