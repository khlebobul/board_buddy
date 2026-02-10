part of 'sea_salt_paper_bloc.dart';

@immutable
sealed class SeaSaltPaperState {}

final class SeaSaltPaperInitial extends SeaSaltPaperState {}

final class SeaSaltPaperStartScreenState extends SeaSaltPaperState {
  final List<Player> players;
  final int scoreLimit;
  final bool isCustomScoreLimit;
  final bool isLoading;
  final bool hasSavedGame;

  SeaSaltPaperStartScreenState({
    required this.players,
    required this.scoreLimit,
    this.isCustomScoreLimit = false,
    this.isLoading = false,
    this.hasSavedGame = false,
  });

  int get defaultScoreLimit =>
      SeaSaltPaperScoreLimit.getScoreLimit(players.isEmpty ? 2 : players.length);

  SeaSaltPaperStartScreenState copyWith({
    List<Player>? players,
    int? scoreLimit,
    bool? isCustomScoreLimit,
    bool? isLoading,
    bool? hasSavedGame,
  }) {
    return SeaSaltPaperStartScreenState(
      players: players ?? this.players,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      isCustomScoreLimit: isCustomScoreLimit ?? this.isCustomScoreLimit,
      isLoading: isLoading ?? this.isLoading,
      hasSavedGame: hasSavedGame ?? this.hasSavedGame,
    );
  }
}
