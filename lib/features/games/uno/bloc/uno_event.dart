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
