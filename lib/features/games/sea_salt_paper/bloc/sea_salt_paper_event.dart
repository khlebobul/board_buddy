part of 'sea_salt_paper_bloc.dart';

@immutable
sealed class SeaSaltPaperEvent {}

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
