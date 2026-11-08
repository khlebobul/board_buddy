part of 'uno_zero_bloc.dart';

@immutable
sealed class UnoZeroEvent {}

class InitializeUnoZeroStartScreen extends UnoZeroEvent {}

class AddUnoZeroPlayer extends UnoZeroEvent {
  final Player player;
  AddUnoZeroPlayer(this.player);
}

class RemoveUnoZeroPlayer extends UnoZeroEvent {
  final int index;
  RemoveUnoZeroPlayer(this.index);
}

class UpdateUnoZeroRounds extends UnoZeroEvent {
  final int totalRounds;
  UpdateUnoZeroRounds(this.totalRounds);
}

class CheckSavedUnoZeroGame extends UnoZeroEvent {}

class LoadSavedUnoZeroGame extends UnoZeroEvent {}

class DeleteSavedUnoZeroGame extends UnoZeroEvent {}

class InitializeUnoZeroGame extends UnoZeroEvent {
  final List<Player> players;
  final int totalRounds;

  InitializeUnoZeroGame({required this.players, required this.totalRounds});
}

class ChangeUnoZeroCurrentPlayer extends UnoZeroEvent {
  final int playerIndex;
  ChangeUnoZeroCurrentPlayer(this.playerIndex);
}

class EnterUnoZeroScore extends UnoZeroEvent {
  final int playerIndex;
  final int score;
  EnterUnoZeroScore(this.playerIndex, this.score);
}

class UndoUnoZeroScore extends UnoZeroEvent {}

class RedoUnoZeroScore extends UnoZeroEvent {}

class ContinueUnoZeroGame extends UnoZeroEvent {}

class StartNewUnoZeroGameWithSamePlayers extends UnoZeroEvent {}

class ReturnUnoZeroToMenu extends UnoZeroEvent {}

class MarkUnoZeroGameEndModalShown extends UnoZeroEvent {}

class SaveUnoZeroGameSession extends UnoZeroEvent {}
