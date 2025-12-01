/// Enum for game phases
enum GamePhase {
  /// Selecting first dealer
  selectingFirstDealer,

  /// Auction (bidding)
  bidding,

  /// Selecting marriage (if needed)
  selectingMarriage,

  /// Gameplay (tricks)
  playing,

  /// Scoring
  scoring,

  /// Barrel warning
  barrelWarning,

  /// Game ended
  gameEnded,
}

/// Enum for card suits
enum CardSuit {
  /// Hearts
  hearts,

  /// Diamonds
  diamonds,

  /// Clubs
  clubs,

  /// Spades
  spades,
}

/// Enum for card ranks
enum CardRank {
  /// 9 - 0 points
  nine(0),

  /// 10 - 10 points
  ten(10),

  /// Jack - 2 points
  jack(2),

  /// Queen - 3 points
  queen(3),

  /// King - 4 points
  king(4),

  /// Ace - 11 points
  ace(11);

  final int points;
  const CardRank(this.points);
}

/// Card class
class ThousandCard {
  final CardSuit suit;
  final CardRank rank;

  const ThousandCard({
    required this.suit,
    required this.rank,
  });

  int get points => rank.points;

  @override
  String toString() => '${rank.name} of ${suit.name}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThousandCard &&
          runtimeType == other.runtimeType &&
          suit == other.suit &&
          rank == other.rank;

  @override
  int get hashCode => suit.hashCode ^ rank.hashCode;
}

/// Marriage class
class Marriage {
  final CardSuit suit;
  final bool isTrump;

  const Marriage({
    required this.suit,
    this.isTrump = false,
  });

  int get points => isTrump ? 100 : 80;

  @override
  String toString() => '${suit.name} marriage (${points}pts)';
}

/// Bid class
class Bid {
  final int amount;
  final int playerIndex;

  const Bid({
    required this.amount,
    required this.playerIndex,
  });

  @override
  String toString() => 'Bid: $amount by player $playerIndex';
}

/// Player data extension for "1000" game
class ThousandPlayerData {
  /// Points in current round
  final int roundScore;

  /// Total points
  final int totalScore;

  /// Number of tricks won in round
  final int tricksWon;

  /// Is on barrel (880+)
  final bool isOnBarrel;

  /// Has bolt (didn't win any tricks)
  final bool hasBolt;

  /// Current player bid
  final int? currentBid;

  const ThousandPlayerData({
    this.roundScore = 0,
    this.totalScore = 0,
    this.tricksWon = 0,
    this.isOnBarrel = false,
    this.hasBolt = false,
    this.currentBid,
  });

  ThousandPlayerData copyWith({
    int? roundScore,
    int? totalScore,
    int? tricksWon,
    bool? isOnBarrel,
    bool? hasBolt,
    int? currentBid,
  }) {
    return ThousandPlayerData(
      roundScore: roundScore ?? this.roundScore,
      totalScore: totalScore ?? this.totalScore,
      tricksWon: tricksWon ?? this.tricksWon,
      isOnBarrel: isOnBarrel ?? this.isOnBarrel,
      hasBolt: hasBolt ?? this.hasBolt,
      currentBid: currentBid ?? this.currentBid,
    );
  }
}

/// Available bids (cards except 9 + marriages)
class BidOption {
  final String label;
  final int value;
  final bool isMarriage;

  const BidOption({
    required this.label,
    required this.value,
    this.isMarriage = false,
  });

  static const List<BidOption> allBidOptions = [
    // Cards
    BidOption(label: '10', value: 100),
    BidOption(label: 'J', value: 105),
    BidOption(label: 'Q', value: 110),
    BidOption(label: 'K', value: 115),
    BidOption(label: 'A', value: 120),
    // Marriages
    BidOption(label: '80', value: 80, isMarriage: true),
    BidOption(label: '100', value: 100, isMarriage: true),
  ];
}
