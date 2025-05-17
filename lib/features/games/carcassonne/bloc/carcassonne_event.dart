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

class CheckSavedGame extends CarcassonneEvent {}

class LoadSavedGame extends CarcassonneEvent {}

class DeleteSavedGame extends CarcassonneEvent {}

class SaveGameSession extends CarcassonneEvent {}
