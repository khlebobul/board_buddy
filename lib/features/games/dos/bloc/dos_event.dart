part of 'dos_bloc.dart';

@immutable
sealed class DosEvent {}

class InitializeDosStartScreen extends DosEvent {}

class SelectGameMode extends DosEvent {
  final String mode;

  SelectGameMode(this.mode);
}

class UpdateScoreLimit extends DosEvent {
  final int scoreLimit;

  UpdateScoreLimit(this.scoreLimit);
}

class AddPlayer extends DosEvent {
  final Player player;

  AddPlayer(this.player);
}

class RemovePlayer extends DosEvent {
  final int index;

  RemovePlayer(this.index);
}

// Database-related events
class CheckSavedGame extends DosEvent {}

class LoadSavedGame extends DosEvent {}

class DeleteSavedGame extends DosEvent {}

class SaveGameSession extends DosEvent {}

class InitializeDosGame extends DosEvent {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  InitializeDosGame({
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });
}

class ChangeCurrentPlayer extends DosEvent {
  final int playerIndex;

  ChangeCurrentPlayer(this.playerIndex);
}

class UpdatePlayerScore extends DosEvent {
  final int scoreChange;

  UpdatePlayerScore(this.scoreChange);
}

class UndoScoreChange extends DosEvent {}

class RedoScoreChange extends DosEvent {}

class ResetScoreAnimation extends DosEvent {}

class StartNewGameWithSamePlayers extends DosEvent {}

class StartNewGame extends DosEvent {}

class ReturnToMenu extends DosEvent {}

class CheckGameEnd extends DosEvent {}

class ContinueGame extends DosEvent {}

class FinishGame extends DosEvent {}

class MarkGameEndModalShown extends DosEvent {}
