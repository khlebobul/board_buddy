part of 'munchkin_bloc.dart';

@immutable
sealed class MunchkinEvent {}

class InitializeMunchkinStartScreen extends MunchkinEvent {}

class SelectGameMode extends MunchkinEvent {
  final String mode;
  SelectGameMode(this.mode);
}

class AddPlayer extends MunchkinEvent {
  final Player player;
  AddPlayer(this.player);
}

class RemovePlayer extends MunchkinEvent {
  final int index;
  RemovePlayer(this.index);
}

// Game screen events
class InitializeGameScreen extends MunchkinEvent {
  final List<Player> players;
  final bool isSinglePlayer;

  InitializeGameScreen({
    required this.players,
    required this.isSinglePlayer,
  });
}

class IncreaseScore extends MunchkinEvent {
  final int playerIndex;

  IncreaseScore(this.playerIndex);
}

class DecreaseScore extends MunchkinEvent {
  final int playerIndex;

  DecreaseScore(this.playerIndex);
}

class IncreaseGear extends MunchkinEvent {
  final int playerIndex;

  IncreaseGear(this.playerIndex);
}

class DecreaseGear extends MunchkinEvent {
  final int playerIndex;

  DecreaseGear(this.playerIndex);
}

class IncreaseLevel extends MunchkinEvent {
  final int playerIndex;

  IncreaseLevel(this.playerIndex);
}

class DecreaseLevel extends MunchkinEvent {
  final int playerIndex;

  DecreaseLevel(this.playerIndex);
}

class ResetScores extends MunchkinEvent {}

class ResetPlayerModifiers extends MunchkinEvent {
  final int playerIndex;

  ResetPlayerModifiers(this.playerIndex);
}

class UpdatePlayerModifier extends MunchkinEvent {
  final int playerIndex;
  final String modifierType;
  final String? value;

  UpdatePlayerModifier({
    required this.playerIndex,
    required this.modifierType,
    required this.value,
  });
}

class TogglePlayerGender extends MunchkinEvent {
  final int playerIndex;

  TogglePlayerGender(this.playerIndex);
}

class TogglePlayerCursed extends MunchkinEvent {
  final int playerIndex;

  TogglePlayerCursed(this.playerIndex);
}

// Undo/Redo events
class UndoAction extends MunchkinEvent {
  final int playerIndex;

  UndoAction(this.playerIndex);
}

class RedoAction extends MunchkinEvent {
  final int playerIndex;

  RedoAction(this.playerIndex);
}
