part of 'uno_flip_bloc.dart';

@immutable
sealed class UnoFlipEvent {}

class InitializeUnoFlipStartScreen extends UnoFlipEvent {}

class SelectGameMode extends UnoFlipEvent {
  final String mode;

  SelectGameMode(this.mode);
}

class UpdateScoreLimit extends UnoFlipEvent {
  final int scoreLimit;

  UpdateScoreLimit(this.scoreLimit);
}

class AddPlayer extends UnoFlipEvent {
  final Player player;

  AddPlayer(this.player);
}

class RemovePlayer extends UnoFlipEvent {
  final int index;

  RemovePlayer(this.index);
}

// Database-related events
class CheckSavedGame extends UnoFlipEvent {}

class LoadSavedGame extends UnoFlipEvent {}

class DeleteSavedGame extends UnoFlipEvent {}

class SaveGameSession extends UnoFlipEvent {}

// Game-related events
class InitializeUnoFlipGame extends UnoFlipEvent {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  InitializeUnoFlipGame({
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });
}

class ChangeCurrentPlayer extends UnoFlipEvent {
  final int playerIndex;

  ChangeCurrentPlayer(this.playerIndex);
}

class UpdatePlayerScore extends UnoFlipEvent {
  final int scoreChange;

  UpdatePlayerScore(this.scoreChange);
}

class UndoScoreChange extends UnoFlipEvent {}

class RedoScoreChange extends UnoFlipEvent {}

class ResetScoreAnimation extends UnoFlipEvent {}

class StartNewGameWithSamePlayers extends UnoFlipEvent {}

class StartNewGame extends UnoFlipEvent {}

class ReturnToMenu extends UnoFlipEvent {}

class CheckGameEnd extends UnoFlipEvent {}
