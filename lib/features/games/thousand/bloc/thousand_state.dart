part of 'thousand_bloc.dart';

@immutable
sealed class ThousandState {}

final class ThousandInitial extends ThousandState {}

/// Start screen state
final class ThousandStartScreenState extends ThousandState {
  final List<Player> players;
  final bool isLoading;
  final bool hasSavedGame;

  ThousandStartScreenState({
    required this.players,
    this.isLoading = false,
    this.hasSavedGame = false,
  });

  ThousandStartScreenState copyWith({
    List<Player>? players,
    bool? isLoading,
    bool? hasSavedGame,
  }) {
    return ThousandStartScreenState(
      players: players ?? this.players,
      isLoading: isLoading ?? this.isLoading,
      hasSavedGame: hasSavedGame ?? this.hasSavedGame,
    );
  }
}

/// Selecting first dealer state
final class SelectingFirstDealerState extends ThousandState {
  final List<Player> players;
  final Map<int, ThousandPlayerData> playerData;

  SelectingFirstDealerState({
    required this.players,
    required this.playerData,
  });
}

/// Bidding phase state
final class BiddingPhaseState extends ThousandState {
  final List<Player> players;
  final Map<int, ThousandPlayerData> playerData;
  final int currentBidderIndex;
  final int? highestBid;
  final int? highestBidderIndex;
  final int firstDealerIndex;
  final int currentDealerIndex;
  /// Players who passed
  final Set<int> passedPlayers;
  final int roundNumber;

  BiddingPhaseState({
    required this.players,
    required this.playerData,
    required this.currentBidderIndex,
    this.highestBid,
    this.highestBidderIndex,
    required this.firstDealerIndex,
    required this.currentDealerIndex,
    Set<int>? passedPlayers,
    this.roundNumber = 1,
  }) : passedPlayers = passedPlayers ?? {};

  BiddingPhaseState copyWith({
    List<Player>? players,
    Map<int, ThousandPlayerData>? playerData,
    int? currentBidderIndex,
    int? highestBid,
    int? highestBidderIndex,
    int? firstDealerIndex,
    int? currentDealerIndex,
    Set<int>? passedPlayers,
    int? roundNumber,
  }) {
    return BiddingPhaseState(
      players: players ?? this.players,
      playerData: playerData ?? this.playerData,
      currentBidderIndex: currentBidderIndex ?? this.currentBidderIndex,
      highestBid: highestBid ?? this.highestBid,
      highestBidderIndex: highestBidderIndex ?? this.highestBidderIndex,
      firstDealerIndex: firstDealerIndex ?? this.firstDealerIndex,
      currentDealerIndex: currentDealerIndex ?? this.currentDealerIndex,
      passedPlayers: passedPlayers ?? this.passedPlayers,
      roundNumber: roundNumber ?? this.roundNumber,
    );
  }

  bool get isBiddingComplete {
    // Bidding is complete when there's a winner and all others passed
    if (highestBidderIndex == null) return false;
    
    final activePlayers = players.length - passedPlayers.length;
    return activePlayers == 1;
  }
}

/// Scoring phase state
final class ScoringPhaseState extends ThousandState {
  final List<Player> players;
  final Map<int, ThousandPlayerData> playerData;
  final int bidWinnerIndex;
  final int winningBid;
  final int firstDealerIndex;
  final int currentDealerIndex;
  /// Entered scores for each player
  final Map<int, int?> enteredScores;
  /// Whether the bidder met their bid
  final bool? bidderSuccess;
  final int roundNumber;

  ScoringPhaseState({
    required this.players,
    required this.playerData,
    required this.bidWinnerIndex,
    required this.winningBid,
    required this.firstDealerIndex,
    required this.currentDealerIndex,
    Map<int, int?>? enteredScores,
    this.bidderSuccess,
    this.roundNumber = 1,
  }) : enteredScores = enteredScores ?? {};

  ScoringPhaseState copyWith({
    List<Player>? players,
    Map<int, ThousandPlayerData>? playerData,
    int? bidWinnerIndex,
    int? winningBid,
    int? firstDealerIndex,
    int? currentDealerIndex,
    Map<int, int?>? enteredScores,
    bool? bidderSuccess,
    int? roundNumber,
  }) {
    return ScoringPhaseState(
      players: players ?? this.players,
      playerData: playerData ?? this.playerData,
      bidWinnerIndex: bidWinnerIndex ?? this.bidWinnerIndex,
      winningBid: winningBid ?? this.winningBid,
      firstDealerIndex: firstDealerIndex ?? this.firstDealerIndex,
      currentDealerIndex: currentDealerIndex ?? this.currentDealerIndex,
      enteredScores: enteredScores ?? this.enteredScores,
      bidderSuccess: bidderSuccess ?? this.bidderSuccess,
      roundNumber: roundNumber ?? this.roundNumber,
    );
  }

  bool get isReadyToFinishScoring {
    // All scores entered and decision on bidder made
    return enteredScores.length == players.length &&
        enteredScores.values.every((score) => score != null) &&
        bidderSuccess != null;
  }
}

/// Barrel warning state
final class BarrelWarningState extends ThousandState {
  final List<Player> players;
  final Map<int, ThousandPlayerData> playerData;
  /// Indices of players on barrel
  final List<int> playersOnBarrel;
  final int firstDealerIndex;
  final int currentDealerIndex;
  final int roundNumber;

  BarrelWarningState({
    required this.players,
    required this.playerData,
    required this.playersOnBarrel,
    required this.firstDealerIndex,
    required this.currentDealerIndex,
    this.roundNumber = 1,
  });
}

/// Game ended state
final class GameEndedState extends ThousandState {
  final List<Player> players;
  final Map<int, ThousandPlayerData> playerData;
  /// null if no one won (all lost)
  final int? winnerIndex;
  final int roundNumber;

  GameEndedState({
    required this.players,
    required this.playerData,
    this.winnerIndex,
    this.roundNumber = 1,
  });

  Player? get winner => winnerIndex != null ? players[winnerIndex!] : null;
}
