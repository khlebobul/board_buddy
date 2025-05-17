part of 'carcassonne_bloc.dart';

@immutable
abstract class CarcassonneEvent {}

class InitializeCarcassonneStartScreen extends CarcassonneEvent {}

class SelectGameMode extends CarcassonneEvent {
  final String mode;

  SelectGameMode(this.mode);
}

class CheckSavedGame extends CarcassonneEvent {}

class LoadSavedGame extends CarcassonneEvent {}

class DeleteSavedGame extends CarcassonneEvent {}

class SaveGameSession extends CarcassonneEvent {}
