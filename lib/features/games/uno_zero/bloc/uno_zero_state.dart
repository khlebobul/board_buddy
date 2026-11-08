part of 'uno_zero_bloc.dart';

@immutable
sealed class UnoZeroState {}

final class UnoZeroInitial extends UnoZeroState {}

final class UnoZeroLoadFailed extends UnoZeroState {}

final class UnoZeroStartScreenState extends UnoZeroState {
  final List<Player> players;
  final int totalRounds;
  final bool hasSavedGame;

  UnoZeroStartScreenState({
    required this.players,
    this.totalRounds = UnoZeroScoreboard.defaultRounds,
    this.hasSavedGame = false,
  });

  bool get isCustomRoundCount => totalRounds != UnoZeroScoreboard.defaultRounds;

  UnoZeroStartScreenState copyWith({
    List<Player>? players,
    int? totalRounds,
    bool? hasSavedGame,
  }) {
    return UnoZeroStartScreenState(
      players: players ?? this.players,
      totalRounds: totalRounds ?? this.totalRounds,
      hasSavedGame: hasSavedGame ?? this.hasSavedGame,
    );
  }
}

final class UnoZeroGameState extends UnoZeroState {
  final List<Player> players;
  final UnoZeroScoreboard scoreboard;
  final int currentPlayerIndex;
  final bool gameEnded;
  final bool hasShownGameEndModal;

  UnoZeroGameState({
    required this.players,
    required this.scoreboard,
    this.currentPlayerIndex = 0,
    this.gameEnded = false,
    this.hasShownGameEndModal = false,
  });

  UnoZeroGameState copyWith({
    List<Player>? players,
    UnoZeroScoreboard? scoreboard,
    int? currentPlayerIndex,
    bool? gameEnded,
    bool? hasShownGameEndModal,
  }) {
    return UnoZeroGameState(
      players: players ?? this.players,
      scoreboard: scoreboard ?? this.scoreboard,
      currentPlayerIndex: currentPlayerIndex ?? this.currentPlayerIndex,
      gameEnded: gameEnded ?? this.gameEnded,
      hasShownGameEndModal: hasShownGameEndModal ?? this.hasShownGameEndModal,
    );
  }
}
