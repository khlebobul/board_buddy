part of 'carcassonne_bloc.dart';

@immutable
abstract class CarcassonneEvent {}

class InitializeCarcassonneStartScreen extends CarcassonneEvent {}

class SelectGameMode extends CarcassonneEvent {
  final String mode;

  SelectGameMode(this.mode);
}

class AddPlayer extends CarcassonneEvent {
  final Player player;

  AddPlayer(this.player);
}

class RemovePlayer extends CarcassonneEvent {
  final int index;

  RemovePlayer(this.index);
}

class InitializeGameScreen extends CarcassonneEvent {
  final List<Player> players;
  final bool isAutomatic;

  InitializeGameScreen({
    required this.players,
    required this.isAutomatic,
  });
}

class IncreaseScore extends CarcassonneEvent {
  final int playerIndex;

  IncreaseScore(this.playerIndex);
}

class DecreaseScore extends CarcassonneEvent {
  final int playerIndex;

  DecreaseScore(this.playerIndex);
}

class ResetScores extends CarcassonneEvent {}

class UndoAction extends CarcassonneEvent {}

class RedoAction extends CarcassonneEvent {}

class CheckSavedGame extends CarcassonneEvent {}

class LoadSavedGame extends CarcassonneEvent {}

class DeleteSavedGame extends CarcassonneEvent {}

class SaveGameSession extends CarcassonneEvent {}
