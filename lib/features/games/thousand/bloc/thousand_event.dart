part of 'thousand_bloc.dart';

@immutable
sealed class ThousandEvent {}

/// Start screen events
class InitializeThousandStartScreen extends ThousandEvent {}

class AddThousandPlayer extends ThousandEvent {
  final Player player;
  AddThousandPlayer(this.player);
}

class RemoveThousandPlayer extends ThousandEvent {
  final int index;
  RemoveThousandPlayer(this.index);
}

/// Game events
class StartThousandGame extends ThousandEvent {
  final List<Player> players;
  StartThousandGame(this.players);
}

/// Select first dealer
class SelectFirstDealer extends ThousandEvent {
  final int playerIndex;
  SelectFirstDealer(this.playerIndex);
}

/// Bidding events
class MakeBid extends ThousandEvent {
  final int bidAmount;
  MakeBid(this.bidAmount);
}

class PassBidding extends ThousandEvent {}

class CompleteBidding extends ThousandEvent {}

/// Scoring events
class EnterPlayerScore extends ThousandEvent {
  final int playerIndex;
  final int score;
  EnterPlayerScore(this.playerIndex, this.score);
}

class ConfirmBidderSuccess extends ThousandEvent {
  final bool success;
  ConfirmBidderSuccess(this.success);
}

class FinishScoring extends ThousandEvent {}

/// Barrel check events
class CheckBarrelStatus extends ThousandEvent {}

class ContinueFromBarrel extends ThousandEvent {}

/// Game end events
class CheckGameEnd extends ThousandEvent {}

class FinishGame extends ThousandEvent {}

class StartNewRound extends ThousandEvent {}

class StartNewGameWithSamePlayers extends ThousandEvent {}

class ReturnToMenu extends ThousandEvent {}

/// Save/load events
class CheckSavedThousandGame extends ThousandEvent {}

class LoadSavedThousandGame extends ThousandEvent {}

class DeleteSavedThousandGame extends ThousandEvent {}

class SaveThousandGameSession extends ThousandEvent {}
