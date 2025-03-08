part of 'common_counter_bloc.dart';

@immutable
abstract class CommonCounterEvent {}

class InitializeCommonCounterStartScreen extends CommonCounterEvent {}

class SelectGameMode extends CommonCounterEvent {
  final String mode;
  SelectGameMode(this.mode);
}

class AddPlayer extends CommonCounterEvent {
  final Player player;
  AddPlayer(this.player);
}

class RemovePlayer extends CommonCounterEvent {
  final int index;
  RemovePlayer(this.index);
}
