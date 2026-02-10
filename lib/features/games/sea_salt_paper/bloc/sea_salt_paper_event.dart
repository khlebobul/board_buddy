part of 'sea_salt_paper_bloc.dart';

@immutable
sealed class SeaSaltPaperEvent {}

// Start screen events
class InitializeSeaSaltPaperStartScreen extends SeaSaltPaperEvent {}

class AddSeaSaltPaperPlayer extends SeaSaltPaperEvent {
  final Player player;
  AddSeaSaltPaperPlayer(this.player);
}

class RemoveSeaSaltPaperPlayer extends SeaSaltPaperEvent {
  final int index;
  RemoveSeaSaltPaperPlayer(this.index);
}

class CheckSavedSeaSaltPaperGame extends SeaSaltPaperEvent {}

class LoadSavedSeaSaltPaperGame extends SeaSaltPaperEvent {}

class DeleteSavedSeaSaltPaperGame extends SeaSaltPaperEvent {}

class UpdateSeaSaltPaperScoreLimit extends SeaSaltPaperEvent {
  final int scoreLimit;
  UpdateSeaSaltPaperScoreLimit(this.scoreLimit);
}

// Game events
class InitializeSeaSaltPaperGame extends SeaSaltPaperEvent {
  final List<Player> players;
  final int scoreLimit;

  InitializeSeaSaltPaperGame({
    required this.players,
    required this.scoreLimit,
  });
}

class ChangeSeaSaltPaperCurrentPlayer extends SeaSaltPaperEvent {
  final int playerIndex;
  ChangeSeaSaltPaperCurrentPlayer(this.playerIndex);
}

class UpdateSeaSaltPaperPlayerScore extends SeaSaltPaperEvent {
  final int scoreChange;
  UpdateSeaSaltPaperPlayerScore(this.scoreChange);
}

class UndoSeaSaltPaperScoreChange extends SeaSaltPaperEvent {}

class RedoSeaSaltPaperScoreChange extends SeaSaltPaperEvent {}

class ResetSeaSaltPaperScoreAnimation extends SeaSaltPaperEvent {}

class StartNewSeaSaltPaperGameWithSamePlayers extends SeaSaltPaperEvent {}

class StartNewSeaSaltPaperGame extends SeaSaltPaperEvent {}

class ReturnSeaSaltPaperToMenu extends SeaSaltPaperEvent {}

class CheckSeaSaltPaperGameEnd extends SeaSaltPaperEvent {}

class ContinueSeaSaltPaperGame extends SeaSaltPaperEvent {}

class FinishSeaSaltPaperGame extends SeaSaltPaperEvent {}

class MarkSeaSaltPaperGameEndModalShown extends SeaSaltPaperEvent {}

class SaveSeaSaltPaperGameSession extends SeaSaltPaperEvent {}

// Sea Salt & Paper specific events
class DeclareMermaidVictory extends SeaSaltPaperEvent {}
