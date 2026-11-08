import 'package:board_buddy/features/games/uno_zero/models/uno_zero_scoreboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  UnoZeroScoreboard fillRound(UnoZeroScoreboard board, List<int> scores) {
    var next = board;
    for (var player = 0; player < scores.length; player++) {
      next = next.enterScore(player, scores[player]);
    }
    return next;
  }

  test('a round advances only after every player has a score', () {
    final board = UnoZeroScoreboard.initial(playerCount: 3, totalRounds: 9);

    final partial = board.enterScore(0, 4).enterScore(1, 0);
    expect(partial.currentRoundNumber, 1);
    expect(partial.completedRounds, 0);
    expect(partial.roundsLeft, 9);
    expect(partial.isComplete, isFalse);

    final advanced = partial.enterScore(2, 7);
    expect(advanced.currentRoundNumber, 2);
    expect(advanced.completedRounds, 1);
    expect(advanced.roundsLeft, 8);
    expect(advanced.previousScores(0), [4]);
    expect(advanced.currentRoundScore(0), isNull);
  });

  test('totals add every entered score, including an open round and zero', () {
    final board = fillRound(
      UnoZeroScoreboard.initial(playerCount: 2, totalRounds: 9),
      [4, 6],
    ).enterScore(0, 0);

    expect(board.total(0), 4);
    expect(board.total(1), 6);
    expect(board.currentRoundScore(0), 0);
    expect(board.previousScores(1), [6]);
  });

  test('the match ends after the chosen number of rounds', () {
    var board = UnoZeroScoreboard.initial(playerCount: 2, totalRounds: 2);
    board = fillRound(board, [1, 2]);
    expect(board.isComplete, isFalse);

    board = fillRound(board, [3, 4]);
    expect(board.isComplete, isTrue);
    expect(board.currentRoundNumber, 2);
    expect(board.roundsLeft, 0);
    expect(board.total(0), 4);
    expect(board.total(1), 6);

    final ignored = board.enterScore(0, 9);
    expect(ignored.total(0), 4);
    expect(ignored.isComplete, isTrue);
  });

  test('ranking is ascending and a shared low score stays tied', () {
    final board = fillRound(
      UnoZeroScoreboard.initial(playerCount: 3, totalRounds: 1),
      [8, 5, 5],
    );

    final standings = board.standings();
    expect(standings.map((standing) => standing.playerIndex), [1, 2, 0]);
    expect(standings.map((standing) => standing.place), [1, 1, 3]);
    expect(standings.map((standing) => standing.total), [5, 5, 8]);
    expect(board.isTiedForFirst, isTrue);
    expect(board.leaderIndexes, [1, 2]);
  });

  test('a unique low score is the only leader', () {
    final board = fillRound(
      UnoZeroScoreboard.initial(playerCount: 2, totalRounds: 1),
      [3, 4],
    );

    expect(board.isTiedForFirst, isFalse);
    expect(board.leaderIndexes, [0]);
    expect(board.standings().map((standing) => standing.place), [1, 2]);
  });

  test('undo reopens a finished round and redo closes it again', () {
    final board = fillRound(
      UnoZeroScoreboard.initial(playerCount: 2, totalRounds: 3),
      [1, 2],
    ).enterScore(0, 5);

    final undoneOpen = board.undo();
    expect(undoneOpen.currentRoundScore(0), isNull);
    expect(undoneOpen.currentRoundNumber, 2);

    final reopened = undoneOpen.undo();
    expect(reopened.currentRoundNumber, 1);
    expect(reopened.completedRounds, 0);
    expect(reopened.currentRoundScore(0), 1);
    expect(reopened.currentRoundScore(1), isNull);
    expect(reopened.total(0), 1);

    final redone = reopened.redo();
    expect(redone.currentRoundNumber, 2);
    expect(redone.previousScores(0), [1]);
    expect(redone.canRedo, isTrue);
  });

  test('continuing a finished match opens one more round', () {
    final finished = fillRound(
      UnoZeroScoreboard.initial(playerCount: 2, totalRounds: 1),
      [2, 2],
    );
    expect(finished.isComplete, isTrue);
    expect(finished.isTiedForFirst, isTrue);

    final continued = finished.continuePastEnd();
    expect(continued.isComplete, isFalse);
    expect(continued.totalRounds, 2);
    expect(continued.currentRoundNumber, 2);
    expect(continued.total(0), 2);
  });

  test('a saved scoreboard restores rounds, totals and undo', () {
    final board = fillRound(
      UnoZeroScoreboard.initial(playerCount: 2, totalRounds: 9),
      [4, 1],
    ).enterScore(1, 3);

    final restored = UnoZeroScoreboard.fromJson(board.toJson());
    expect(restored.totalRounds, 9);
    expect(restored.currentRoundNumber, 2);
    expect(restored.total(0), 4);
    expect(restored.total(1), 4);
    expect(restored.currentRoundScore(1), 3);
    expect(restored.canUndo, isTrue);

    final undone = restored.undo();
    expect(undone.currentRoundScore(1), isNull);
    expect(undone.total(1), 1);
  });
}
