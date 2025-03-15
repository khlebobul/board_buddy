part of 'scrabble_bloc.dart';

@immutable
sealed class ScrabbleEvent {}

final class InitializeScrabbleStartScreen extends ScrabbleEvent {}

final class AddPlayer extends ScrabbleEvent {
  final Player player;

  AddPlayer(this.player);
}

final class RemovePlayer extends ScrabbleEvent {
  final int index;

  RemovePlayer(this.index);
}
