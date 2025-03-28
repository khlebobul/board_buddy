part of 'uno_bloc.dart';

@immutable
sealed class UnoEvent {}

class InitializeUnoStartScreen extends UnoEvent {}

class SelectGameMode extends UnoEvent {
  final String mode;

  SelectGameMode(this.mode);
}

class UpdateScoreLimit extends UnoEvent {
  final int scoreLimit;

  UpdateScoreLimit(this.scoreLimit);
}

class AddPlayer extends UnoEvent {
  final Player player;

  AddPlayer(this.player);
}

class RemovePlayer extends UnoEvent {
  final int index;

  RemovePlayer(this.index);
}

// Database-related events
class CheckSavedGame extends UnoEvent {}

class LoadSavedGame extends UnoEvent {}

class DeleteSavedGame extends UnoEvent {}

class SaveGameSession extends UnoEvent {}

// Game-related events
class InitializeUnoGame extends UnoEvent {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  InitializeUnoGame({
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });
}

class ChangeCurrentPlayer extends UnoEvent {
  final int playerIndex;

  ChangeCurrentPlayer(this.playerIndex);
}

class UpdatePlayerScore extends UnoEvent {
  final int scoreChange;

  UpdatePlayerScore(this.scoreChange);
}

class UndoScoreChange extends UnoEvent {}

class RedoScoreChange extends UnoEvent {}

class ResetScoreAnimation extends UnoEvent {}

class StartNewGameWithSamePlayers extends UnoEvent {}

class StartNewGame extends UnoEvent {}

class ReturnToMenu extends UnoEvent {}

class CheckGameEnd extends UnoEvent {}
