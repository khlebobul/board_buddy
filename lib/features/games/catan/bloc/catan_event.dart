part of 'catan_bloc.dart';

enum CatanBadgeType { longestRoad, largestArmy }

@immutable
sealed class CatanEvent {}

class InitializeCatanStartScreen extends CatanEvent {}

class SelectGameMode extends CatanEvent {
  final String mode;

  SelectGameMode(this.mode);
}

class UpdateScoreLimit extends CatanEvent {
  final int scoreLimit;

  UpdateScoreLimit(this.scoreLimit);
}

class AddPlayer extends CatanEvent {
  final Player player;

  AddPlayer(this.player);
}

class RemovePlayer extends CatanEvent {
  final int index;

  RemovePlayer(this.index);
}

// Database-related events
class CheckSavedGame extends CatanEvent {}

class LoadSavedGame extends CatanEvent {}

class DeleteSavedGame extends CatanEvent {}

class SaveGameSession extends CatanEvent {}

// Game-related events
class InitializeCatanGame extends CatanEvent {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  InitializeCatanGame({
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });
}

class ChangeCurrentPlayer extends CatanEvent {
  final int playerIndex;

  ChangeCurrentPlayer(this.playerIndex);
}

class UpdatePlayerScore extends CatanEvent {
  final int scoreChange;

  UpdatePlayerScore(this.scoreChange);
}

class UndoScoreChange extends CatanEvent {}

class RedoScoreChange extends CatanEvent {}

class ResetScoreAnimation extends CatanEvent {}

class StartNewGameWithSamePlayers extends CatanEvent {}

class StartNewGame extends CatanEvent {}

class ReturnToMenu extends CatanEvent {}

class CheckGameEnd extends CatanEvent {}

class ContinueGame extends CatanEvent {}

class FinishGame extends CatanEvent {}

class MarkGameEndModalShown extends CatanEvent {}

class ClaimBadge extends CatanEvent {
  final CatanBadgeType badgeType;

  ClaimBadge(this.badgeType);
}
