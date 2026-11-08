/// Round scores for UNO Zero / UNO Golf.
///
/// The lowest total wins. A round advances only after every player has a
/// score, and the match ends when [totalRounds] rounds are complete.
class UnoZeroEdit {
  final int roundIndex;
  final int playerIndex;
  final int? previous;
  final int next;
  final bool openedRound;
  final bool continuedMatch;

  const UnoZeroEdit({
    required this.roundIndex,
    required this.playerIndex,
    required this.previous,
    required this.next,
    required this.openedRound,
    this.continuedMatch = false,
  });

  Map<String, dynamic> toJson() => {
        'roundIndex': roundIndex,
        'playerIndex': playerIndex,
        'previous': previous,
        'next': next,
        'openedRound': openedRound,
        'continuedMatch': continuedMatch,
      };

  factory UnoZeroEdit.fromJson(Map<String, dynamic> json) {
    return UnoZeroEdit(
      roundIndex: (json['roundIndex'] as num).toInt(),
      playerIndex: (json['playerIndex'] as num).toInt(),
      previous:
          json['previous'] == null ? null : (json['previous'] as num).toInt(),
      next: (json['next'] as num).toInt(),
      openedRound: json['openedRound'] == true,
      continuedMatch: json['continuedMatch'] == true,
    );
  }
}

class UnoZeroStanding {
  final int playerIndex;
  final int total;
  final int place;

  const UnoZeroStanding({
    required this.playerIndex,
    required this.total,
    required this.place,
  });
}

class UnoZeroScoreboard {
  static const gameType = 'uno_zero';
  static const defaultRounds = 9;
  static const minRounds = 1;
  static const maxRounds = 18;
  static const maxScore = 999;

  final int totalRounds;
  final List<List<int?>> rounds;
  final List<UnoZeroEdit> undoStack;
  final List<UnoZeroEdit> redoStack;

  UnoZeroScoreboard({
    required this.totalRounds,
    required this.rounds,
    this.undoStack = const [],
    this.redoStack = const [],
  });

  factory UnoZeroScoreboard.initial({
    required int playerCount,
    int totalRounds = defaultRounds,
  }) {
    return UnoZeroScoreboard(
      totalRounds: totalRounds,
      rounds: [List<int?>.filled(playerCount, null)],
    );
  }

  int get playerCount => rounds.first.length;

  bool get canUndo => undoStack.isNotEmpty;

  bool get canRedo => redoStack.isNotEmpty;

  int get completedRounds =>
      rounds.where((round) => round.every((score) => score != null)).length;

  bool get isComplete => completedRounds >= totalRounds;

  bool get hasAnyScore =>
      rounds.any((round) => round.any((score) => score != null));

  int get currentRoundNumber {
    final openRound = rounds.indexWhere(
      (round) => round.any((score) => score == null),
    );
    if (openRound == -1) return rounds.length;
    return openRound + 1;
  }

  int get roundsLeft => totalRounds - completedRounds;

  int total(int playerIndex) {
    var sum = 0;
    for (final round in rounds) {
      final score = round[playerIndex];
      if (score != null) sum += score;
    }
    return sum;
  }

  int? currentRoundScore(int playerIndex) {
    return rounds[currentRoundNumber - 1][playerIndex];
  }

  List<int> previousScores(int playerIndex) {
    final current = currentRoundNumber - 1;
    final scores = <int>[];
    for (var round = 0; round < current; round++) {
      final score = rounds[round][playerIndex];
      if (score != null) scores.add(score);
    }
    return scores;
  }

  List<UnoZeroStanding> standings() {
    final indexes = [for (var i = 0; i < playerCount; i++) i];
    indexes.sort((a, b) {
      final byScore = total(a).compareTo(total(b));
      if (byScore != 0) return byScore;
      return a.compareTo(b);
    });

    final ranked = <UnoZeroStanding>[];
    for (var i = 0; i < indexes.length; i++) {
      final sameAsPrevious =
          i > 0 && total(indexes[i]) == total(indexes[i - 1]);
      ranked.add(
        UnoZeroStanding(
          playerIndex: indexes[i],
          total: total(indexes[i]),
          place: sameAsPrevious ? ranked.last.place : i + 1,
        ),
      );
    }
    return ranked;
  }

  bool get isTiedForFirst =>
      standings().where((standing) => standing.place == 1).length > 1;

  List<int> get leaderIndexes => standings()
      .where((standing) => standing.place == 1)
      .map((standing) => standing.playerIndex)
      .toList();

  UnoZeroScoreboard enterScore(int playerIndex, int score) {
    if (isComplete) return this;
    if (playerIndex < 0 || playerIndex >= playerCount) return this;
    if (score < 0 || score > maxScore) return this;

    final roundIndex = currentRoundNumber - 1;
    final previous = rounds[roundIndex][playerIndex];
    if (previous == score) return this;

    final nextRounds = _copyRounds();
    nextRounds[roundIndex][playerIndex] = score;
    final openedRound =
        nextRounds[roundIndex].every((value) => value != null) &&
            nextRounds.length < totalRounds;
    if (openedRound) {
      nextRounds.add(List<int?>.filled(playerCount, null));
    }

    return UnoZeroScoreboard(
      totalRounds: totalRounds,
      rounds: nextRounds,
      undoStack: [
        ...undoStack,
        UnoZeroEdit(
          roundIndex: roundIndex,
          playerIndex: playerIndex,
          previous: previous,
          next: score,
          openedRound: openedRound,
        ),
      ],
    );
  }

  UnoZeroScoreboard undo() {
    if (!canUndo) return this;
    final edit = undoStack.last;
    final nextRounds = _apply(edit, forward: false);
    final droppedContinuation =
        edit.continuedMatch && nextRounds.length < rounds.length;
    return UnoZeroScoreboard(
      totalRounds: droppedContinuation ? totalRounds - 1 : totalRounds,
      rounds: nextRounds,
      undoStack: undoStack.sublist(0, undoStack.length - 1),
      redoStack: [...redoStack, edit],
    );
  }

  UnoZeroScoreboard redo() {
    if (!canRedo) return this;
    final edit = redoStack.last;
    final nextRounds = _apply(edit, forward: true);
    final addedContinuation =
        edit.continuedMatch && nextRounds.length > rounds.length;
    return UnoZeroScoreboard(
      totalRounds: addedContinuation ? totalRounds + 1 : totalRounds,
      rounds: nextRounds,
      undoStack: [...undoStack, edit],
      redoStack: redoStack.sublist(0, redoStack.length - 1),
    );
  }

  /// Keeps the finished rounds and opens one more, so a completed match can
  /// continue without inventing a winner. The extra round is an undo step, so
  /// earlier scores can still be corrected.
  UnoZeroScoreboard continuePastEnd() {
    if (!isComplete) return this;
    final lastRound = rounds.length - 1;
    final keptScore = rounds[lastRound][0] ?? 0;
    return UnoZeroScoreboard(
      totalRounds: totalRounds + 1,
      rounds: [..._copyRounds(), List<int?>.filled(playerCount, null)],
      undoStack: [
        ...undoStack,
        UnoZeroEdit(
          roundIndex: lastRound,
          playerIndex: 0,
          previous: keptScore,
          next: keptScore,
          openedRound: false,
          continuedMatch: true,
        ),
      ],
    );
  }

  UnoZeroScoreboard reset() {
    return UnoZeroScoreboard.initial(
      playerCount: playerCount,
      totalRounds: totalRounds,
    );
  }

  Map<String, dynamic> toJson() => {
        'totalRounds': totalRounds,
        'rounds': rounds,
        'undo': undoStack.map((edit) => edit.toJson()).toList(),
        'redo': redoStack.map((edit) => edit.toJson()).toList(),
      };

  factory UnoZeroScoreboard.fromJson(Map<String, dynamic> json) {
    final rawRounds = json['rounds'] as List<dynamic>;
    final rounds = rawRounds.map((row) {
      return (row as List<dynamic>).map((cell) {
        if (cell == null) return null;
        return (cell as num).toInt();
      }).toList();
    }).toList();

    final totalRounds = json['totalRounds'] is num
        ? (json['totalRounds'] as num).toInt()
        : (json['score_limit'] as num?)?.toInt() ?? defaultRounds;

    return UnoZeroScoreboard(
      totalRounds: totalRounds,
      rounds: rounds,
      undoStack: _parseEdits(json['undo']),
      redoStack: _parseEdits(json['redo']),
    );
  }

  static List<UnoZeroEdit> _parseEdits(Object? raw) {
    if (raw is! List) return const [];
    final edits = <UnoZeroEdit>[];
    for (final item in raw) {
      if (item is Map) {
        edits.add(UnoZeroEdit.fromJson(Map<String, dynamic>.from(item)));
      }
    }
    return edits;
  }

  List<List<int?>> _copyRounds() =>
      rounds.map((round) => List<int?>.from(round)).toList();

  List<List<int?>> _apply(UnoZeroEdit edit, {required bool forward}) {
    final nextRounds = _copyRounds();
    if (edit.continuedMatch) {
      if (forward) {
        if (nextRounds.length == edit.roundIndex + 1) {
          nextRounds.add(List<int?>.filled(playerCount, null));
        }
        return nextRounds;
      }
      final canDrop = nextRounds.length == edit.roundIndex + 2 &&
          nextRounds.last.every((score) => score == null);
      if (canDrop) nextRounds.removeLast();
      return nextRounds;
    }
    if (forward) {
      nextRounds[edit.roundIndex][edit.playerIndex] = edit.next;
      final shouldOpenRound =
          edit.openedRound && nextRounds.length == edit.roundIndex + 1;
      if (shouldOpenRound) {
        nextRounds.add(List<int?>.filled(playerCount, null));
      }
      return nextRounds;
    }

    final extraRound = edit.openedRound &&
        nextRounds.length == edit.roundIndex + 2 &&
        nextRounds.last.every((score) => score == null);
    if (extraRound) nextRounds.removeLast();
    nextRounds[edit.roundIndex][edit.playerIndex] = edit.previous;
    return nextRounds;
  }
}
