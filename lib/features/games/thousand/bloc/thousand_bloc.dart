import 'package:bloc/bloc.dart';
import 'package:board_buddy/features/games/thousand/models/thousand_models.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/foundation.dart';

part 'thousand_event.dart';
part 'thousand_state.dart';

class ThousandBloc extends Bloc<ThousandEvent, ThousandState> {
  final List<ThousandState> _undoStack = [];
  final List<ThousandState> _redoStack = [];

  ThousandBloc() : super(ThousandInitial()) {
    // Start screen events
    on<InitializeThousandStartScreen>(_onInitializeStartScreen);
    on<AddThousandPlayer>(_onAddPlayer);
    on<RemoveThousandPlayer>(_onRemovePlayer);
    on<CheckSavedThousandGame>(_onCheckSavedGame);
    on<LoadSavedThousandGame>(_onLoadSavedGame);
    on<DeleteSavedThousandGame>(_onDeleteSavedGame);

    // Game events
    on<StartThousandGame>(_onStartGame);
    on<SelectFirstDealer>(_onSelectFirstDealer);

    // Bidding events
    on<MakeBid>(_onMakeBid);
    on<PassBidding>(_onPassBidding);
    on<CompleteBidding>(_onCompleteBidding);

    // Scoring events
    on<EnterPlayerScore>(_onEnterPlayerScore);
    on<AddCardToPlayerScore>(_onAddCardToPlayerScore);
    on<ClearPlayerScore>(_onClearPlayerScore);
    on<ConfirmPlayerScore>(_onConfirmPlayerScore);
    on<ConfirmBidderSuccess>(_onConfirmBidderSuccess);
    on<FinishScoring>(_onFinishScoring);

    // Barrel check events
    on<CheckBarrelStatus>(_onCheckBarrelStatus);
    on<ContinueFromBarrel>(_onContinueFromBarrel);

    // Game end events
    on<CheckGameEnd>(_onCheckGameEnd);
    on<FinishGame>(_onFinishGame);
    on<StartNewRound>(_onStartNewRound);
    on<StartNewGameWithSamePlayers>(_onStartNewGameWithSamePlayers);
    on<ReturnToMenu>(_onReturnToMenu);
    on<SaveThousandGameSession>(_onSaveGameSession);

    // Undo/redo events
    on<UndoThousandAction>(_onUndoAction);
    on<RedoThousandAction>(_onRedoAction);
  }

  // ============ Start screen event handlers ============

  void _onInitializeStartScreen(
    InitializeThousandStartScreen event,
    Emitter<ThousandState> emit,
  ) {
    emit(ThousandStartScreenState(players: []));
    add(CheckSavedThousandGame());
  }

  void _onAddPlayer(
    AddThousandPlayer event,
    Emitter<ThousandState> emit,
  ) {
    if (state is ThousandStartScreenState) {
      final currentState = state as ThousandStartScreenState;
      emit(currentState.copyWith(
        players: [...currentState.players, event.player],
      ));
    }
  }

  void _onRemovePlayer(
    RemoveThousandPlayer event,
    Emitter<ThousandState> emit,
  ) {
    if (state is ThousandStartScreenState) {
      final currentState = state as ThousandStartScreenState;
      final updatedPlayers = List<Player>.from(currentState.players);
      updatedPlayers.removeAt(event.index);
      emit(currentState.copyWith(players: updatedPlayers));
    }
  }

  void _onCheckSavedGame(
    CheckSavedThousandGame event,
    Emitter<ThousandState> emit,
  ) async {
    if (state is ThousandStartScreenState) {
      final currentState = state as ThousandStartScreenState;
      final hasSaved = await DatabaseService.hasGameSession('thousand');
      emit(currentState.copyWith(hasSavedGame: hasSaved));
    }
  }

  void _onLoadSavedGame(
    LoadSavedThousandGame event,
    Emitter<ThousandState> emit,
  ) async {
    try {
      final gameData = await DatabaseService.getLatestGameSession('thousand');

      if (gameData == null) {
        debugPrint('No saved game found for Thousand');
        return;
      }

      final session = gameData['session'] as Map<String, dynamic>;
      final players = gameData['players'] as List<Player>;

      debugPrint('Loading Thousand game with phase: ${session['phase']}');

      // Parse player data
      final Map<int, ThousandPlayerData> playerData = {};
      if (session.containsKey('playerData')) {
        final playerDataMap = session['playerData'] as Map<String, dynamic>;
        playerDataMap.forEach((key, value) {
          final data = value as Map<String, dynamic>;
          playerData[int.parse(key)] = ThousandPlayerData(
            roundScore: data['roundScore'] as int? ?? 0,
            totalScore: data['totalScore'] as int? ?? 0,
            tricksWon: data['tricksWon'] as int? ?? 0,
            isOnBarrel: data['isOnBarrel'] as bool? ?? false,
            hasBolt: data['hasBolt'] as bool? ?? false,
            currentBid: data['currentBid'] as int?,
          );
        });
      }

      // Restore the appropriate state based on saved phase
      final phase = session['phase'] as String?;

      if (phase == 'selectingFirstDealer') {
        emit(SelectingFirstDealerState(
          players: players,
          playerData: playerData,
        ));
      } else if (phase == 'bidding') {
        final passedPlayersList = (session['passedPlayers'] as List<dynamic>?)
                ?.map((e) => e as int)
                .toList() ??
            [];

        emit(BiddingPhaseState(
          players: players,
          playerData: playerData,
          currentBidderIndex: session['currentBidderIndex'] as int,
          highestBid: session['highestBid'] as int?,
          highestBidderIndex: session['highestBidderIndex'] as int?,
          firstDealerIndex: session['firstDealerIndex'] as int,
          currentDealerIndex: session['currentDealerIndex'] as int,
          passedPlayers: Set<int>.from(passedPlayersList),
          roundNumber: session['roundNumber'] as int? ?? 1,
        ));
      } else if (phase == 'scoring') {
        // Parse enteredScores
        final Map<int, int?> enteredScores = {};
        if (session.containsKey('enteredScores')) {
          final scoresMap = session['enteredScores'] as Map<String, dynamic>;
          scoresMap.forEach((key, value) {
            enteredScores[int.parse(key)] = value as int?;
          });
        }

        // Parse currentScoreCalculation
        final Map<int, int> currentScoreCalculation = {};
        if (session.containsKey('currentScoreCalculation')) {
          final calcMap =
              session['currentScoreCalculation'] as Map<String, dynamic>;
          calcMap.forEach((key, value) {
            currentScoreCalculation[int.parse(key)] = value as int;
          });
        }

        emit(ScoringPhaseState(
          players: players,
          playerData: playerData,
          bidWinnerIndex: session['bidWinnerIndex'] as int,
          winningBid: session['winningBid'] as int,
          firstDealerIndex: session['firstDealerIndex'] as int,
          currentDealerIndex: session['currentDealerIndex'] as int,
          enteredScores: enteredScores,
          currentScoreCalculation: currentScoreCalculation,
          bidderSuccess: session['bidderSuccess'] as bool?,
          roundNumber: session['roundNumber'] as int? ?? 1,
        ));
      } else if (phase == 'barrelWarning') {
        final playersOnBarrelList =
            (session['playersOnBarrel'] as List<dynamic>?)
                    ?.map((e) => e as int)
                    .toList() ??
                [];

        emit(BarrelWarningState(
          players: players,
          playerData: playerData,
          playersOnBarrel: playersOnBarrelList,
          firstDealerIndex: session['firstDealerIndex'] as int,
          currentDealerIndex: session['currentDealerIndex'] as int,
          roundNumber: session['roundNumber'] as int? ?? 1,
        ));
      } else {
        debugPrint('Unknown phase: $phase');
      }

      debugPrint('Thousand game loaded successfully');
    } catch (e) {
      debugPrint('Error loading Thousand game: $e');
    }
  }

  void _onDeleteSavedGame(
    DeleteSavedThousandGame event,
    Emitter<ThousandState> emit,
  ) async {
    await DatabaseService.deleteGameSession('thousand');
    if (state is ThousandStartScreenState) {
      final currentState = state as ThousandStartScreenState;
      emit(currentState.copyWith(hasSavedGame: false));
    }
  }

  // ============ Game event handlers ============

  void _onStartGame(
    StartThousandGame event,
    Emitter<ThousandState> emit,
  ) {
    _resetHistory();

    // Initialize data for each player
    final playerData = <int, ThousandPlayerData>{};
    for (int i = 0; i < event.players.length; i++) {
      playerData[i] = const ThousandPlayerData();
    }

    // Transition to selecting first dealer
    emit(SelectingFirstDealerState(
      players: event.players,
      playerData: playerData,
    ));
  }

  void _onSelectFirstDealer(
    SelectFirstDealer event,
    Emitter<ThousandState> emit,
  ) {
    if (state is SelectingFirstDealerState) {
      final currentState = state as SelectingFirstDealerState;

      // Start bidding
      // First bidder is the player after the dealer
      final firstBidderIndex =
          (event.playerIndex + 1) % currentState.players.length;

      emit(BiddingPhaseState(
        players: currentState.players,
        playerData: currentState.playerData,
        currentBidderIndex: firstBidderIndex,
        firstDealerIndex: event.playerIndex,
        currentDealerIndex: event.playerIndex,
        roundNumber: 1,
      ));

      // Save game state after selecting dealer
      add(SaveThousandGameSession());
    }
  }

  // ============ Bidding event handlers ============

  void _onMakeBid(
    MakeBid event,
    Emitter<ThousandState> emit,
  ) {
    if (state is BiddingPhaseState) {
      final currentState = state as BiddingPhaseState;

      // Validate bid
      if (currentState.highestBid != null &&
          event.bidAmount <= currentState.highestBid!) {
        return; // Bid must be higher than current
      }

      _saveStateForUndo();

      // If this is the first bid and it equals 100, next dealer = this player
      int nextDealer = currentState.currentDealerIndex;
      if (currentState.highestBid == null && event.bidAmount == 100) {
        nextDealer = currentState.currentBidderIndex;
      }

      // Update player data
      final updatedPlayerData =
          Map<int, ThousandPlayerData>.from(currentState.playerData);
      updatedPlayerData[currentState.currentBidderIndex] =
          updatedPlayerData[currentState.currentBidderIndex]!.copyWith(
        currentBid: event.bidAmount,
      );

      // Move to next player
      int nextBidder =
          (currentState.currentBidderIndex + 1) % currentState.players.length;

      // Skip players who passed
      while (currentState.passedPlayers.contains(nextBidder)) {
        nextBidder = (nextBidder + 1) % currentState.players.length;
      }

      emit(currentState.copyWith(
        playerData: updatedPlayerData,
        highestBid: event.bidAmount,
        highestBidderIndex: currentState.currentBidderIndex,
        currentBidderIndex: nextBidder,
        currentDealerIndex: nextDealer,
      ));

      // Save game state after bid
      add(SaveThousandGameSession());
    }
  }

  void _onPassBidding(
    PassBidding event,
    Emitter<ThousandState> emit,
  ) {
    if (state is BiddingPhaseState) {
      final currentState = state as BiddingPhaseState;

      _saveStateForUndo();

      // Add player to passed players list
      final updatedPassedPlayers = Set<int>.from(currentState.passedPlayers);
      updatedPassedPlayers.add(currentState.currentBidderIndex);

      // Move to next player
      int nextBidder =
          (currentState.currentBidderIndex + 1) % currentState.players.length;

      // Skip players who passed
      while (updatedPassedPlayers.contains(nextBidder) &&
          updatedPassedPlayers.length < currentState.players.length - 1) {
        nextBidder = (nextBidder + 1) % currentState.players.length;
      }

      final updatedState = currentState.copyWith(
        passedPlayers: updatedPassedPlayers,
        currentBidderIndex: nextBidder,
      );

      emit(updatedState);

      // Save game state after passing
      add(SaveThousandGameSession());

      // If bidding is complete, automatically transition to scoring
      if (updatedState.isBiddingComplete) {
        add(CompleteBidding());
      }
    }
  }

  void _onCompleteBidding(
    CompleteBidding event,
    Emitter<ThousandState> emit,
  ) {
    if (state is BiddingPhaseState) {
      final currentState = state as BiddingPhaseState;

      _saveStateForUndo();

      if (currentState.highestBidderIndex != null &&
          currentState.highestBid != null) {
        // Transition to scoring
        emit(ScoringPhaseState(
          players: currentState.players,
          playerData: currentState.playerData,
          bidWinnerIndex: currentState.highestBidderIndex!,
          winningBid: currentState.highestBid!,
          firstDealerIndex: currentState.firstDealerIndex,
          currentDealerIndex: currentState.currentDealerIndex,
          roundNumber: currentState.roundNumber,
        ));

        // Save game state when transitioning to scoring
        add(SaveThousandGameSession());
      }
    }
  }

  // ============ Scoring event handlers ============

  void _onEnterPlayerScore(
    EnterPlayerScore event,
    Emitter<ThousandState> emit,
  ) {
    if (state is ScoringPhaseState) {
      final currentState = state as ScoringPhaseState;

      final updatedScores = Map<int, int?>.from(currentState.enteredScores);
      updatedScores[event.playerIndex] = event.score;

      // Check if player didn't win any tricks (bolt)
      final updatedPlayerData =
          Map<int, ThousandPlayerData>.from(currentState.playerData);
      if (event.score == 0) {
        updatedPlayerData[event.playerIndex] =
            updatedPlayerData[event.playerIndex]!.copyWith(hasBolt: true);
      }

      emit(currentState.copyWith(
        enteredScores: updatedScores,
        playerData: updatedPlayerData,
      ));

      // Save game state after entering score
      add(SaveThousandGameSession());
    }
  }

  void _onAddCardToPlayerScore(
    AddCardToPlayerScore event,
    Emitter<ThousandState> emit,
  ) {
    if (state is ScoringPhaseState) {
      final currentState = state as ScoringPhaseState;
      _saveStateForUndo();

      final updatedCalculation =
          Map<int, int>.from(currentState.currentScoreCalculation);
      final currentScore = updatedCalculation[event.playerIndex] ?? 0;
      updatedCalculation[event.playerIndex] = currentScore + event.cardPoints;

      emit(currentState.copyWith(
        currentScoreCalculation: updatedCalculation,
      ));
    }
  }

  void _onClearPlayerScore(
    ClearPlayerScore event,
    Emitter<ThousandState> emit,
  ) {
    if (state is ScoringPhaseState) {
      final currentState = state as ScoringPhaseState;
      _saveStateForUndo();

      final updatedCalculation =
          Map<int, int>.from(currentState.currentScoreCalculation);
      updatedCalculation.remove(event.playerIndex);

      emit(currentState.copyWith(
        currentScoreCalculation: updatedCalculation,
      ));
    }
  }

  void _onConfirmPlayerScore(
    ConfirmPlayerScore event,
    Emitter<ThousandState> emit,
  ) {
    if (state is ScoringPhaseState) {
      final currentState = state as ScoringPhaseState;
      _saveStateForUndo();

      final score =
          currentState.currentScoreCalculation[event.playerIndex] ?? 0;

      final updatedScores = Map<int, int?>.from(currentState.enteredScores);
      updatedScores[event.playerIndex] = score;

      final updatedPlayerData =
          Map<int, ThousandPlayerData>.from(currentState.playerData);
      if (score == 0) {
        updatedPlayerData[event.playerIndex] =
            updatedPlayerData[event.playerIndex]!.copyWith(hasBolt: true);
      }

      emit(currentState.copyWith(
        enteredScores: updatedScores,
        playerData: updatedPlayerData,
      ));

      // Save game state after confirming score
      add(SaveThousandGameSession());
    }
  }

  void _onConfirmBidderSuccess(
    ConfirmBidderSuccess event,
    Emitter<ThousandState> emit,
  ) {
    if (state is ScoringPhaseState) {
      final currentState = state as ScoringPhaseState;

      _saveStateForUndo();

      emit(currentState.copyWith(bidderSuccess: event.success));

      // Save game state after confirming bidder success
      add(SaveThousandGameSession());

      // If all data is entered, can finish scoring
      final updatedState = state as ScoringPhaseState;
      if (updatedState.isReadyToFinishScoring) {
        add(FinishScoring());
      }
    }
  }

  void _onFinishScoring(
    FinishScoring event,
    Emitter<ThousandState> emit,
  ) {
    if (state is ScoringPhaseState) {
      final currentState = state as ScoringPhaseState;

      _saveStateForUndo();

      // Update total player scores
      final updatedPlayerData =
          Map<int, ThousandPlayerData>.from(currentState.playerData);

      for (int i = 0; i < currentState.players.length; i++) {
        final enteredScore = currentState.enteredScores[i] ?? 0;
        final currentData = updatedPlayerData[i]!;

        int scoreToAdd = enteredScore;

        // If this is the bidder
        if (i == currentState.bidWinnerIndex) {
          if (currentState.bidderSuccess == true) {
            // Met the bid - add scored points
            scoreToAdd = enteredScore;
          } else {
            // Didn't meet the bid - subtract the bid amount
            scoreToAdd = -currentState.winningBid;
          }
        }

        final newTotalScore = currentData.totalScore + scoreToAdd;

        // Check barrel (880+)
        final isOnBarrel = newTotalScore >= 880 && newTotalScore < 1000;

        updatedPlayerData[i] = currentData.copyWith(
          roundScore: enteredScore,
          totalScore: newTotalScore,
          isOnBarrel: isOnBarrel,
        );
      }

      // Check if there are players on barrel
      final playersOnBarrel = <int>[];
      for (int i = 0; i < currentState.players.length; i++) {
        if (updatedPlayerData[i]!.isOnBarrel) {
          playersOnBarrel.add(i);
        }
      }

      // Update state with new scores
      final updatedState = currentState.copyWith(
        playerData: updatedPlayerData,
      );

      if (playersOnBarrel.isNotEmpty) {
        // Show barrel warning
        emit(BarrelWarningState(
          players: updatedState.players,
          playerData: updatedPlayerData,
          playersOnBarrel: playersOnBarrel,
          firstDealerIndex: updatedState.firstDealerIndex,
          currentDealerIndex: updatedState.currentDealerIndex,
          roundNumber: updatedState.roundNumber,
        ));

        // Save game state after finishing scoring
        add(SaveThousandGameSession());
      } else {
        // First update state with new scores
        emit(updatedState);
        // Save game state after finishing scoring
        add(SaveThousandGameSession());
        // Then check game end
        add(CheckGameEnd());
      }
    }
  }

  // ============ Barrel check event handlers ============

  void _onCheckBarrelStatus(
    CheckBarrelStatus event,
    Emitter<ThousandState> emit,
  ) {
    // Check barrel status (called after each round)
    // For now, just continue
    add(CheckGameEnd());
  }

  void _onContinueFromBarrel(
    ContinueFromBarrel event,
    Emitter<ThousandState> emit,
  ) {
    if (state is BarrelWarningState) {
      // Check game end
      add(CheckGameEnd());
    }
  }

  // ============ Game end event handlers ============

  void _onCheckGameEnd(
    CheckGameEnd event,
    Emitter<ThousandState> emit,
  ) {
    final currentState = state;
    List<Player> players = [];
    Map<int, ThousandPlayerData> playerData = {};
    int roundNumber = 1;

    if (currentState is ScoringPhaseState) {
      players = currentState.players;
      playerData = currentState.playerData;
      roundNumber = currentState.roundNumber;
    } else if (currentState is BarrelWarningState) {
      players = currentState.players;
      playerData = currentState.playerData;
      roundNumber = currentState.roundNumber;
    } else {
      return;
    }

    // Check if someone reached 1000 points
    int? winnerIndex;
    for (int i = 0; i < players.length; i++) {
      if (playerData[i]!.totalScore >= 1000) {
        winnerIndex = i;
        break;
      }
    }

    if (winnerIndex != null) {
      // Game ended
      emit(GameEndedState(
        players: players,
        playerData: playerData,
        winnerIndex: winnerIndex,
        roundNumber: roundNumber,
      ));
    } else {
      // Continue game - start new round
      add(StartNewRound());
    }
  }

  void _onFinishGame(
    FinishGame event,
    Emitter<ThousandState> emit,
  ) {
    // Force game end
    if (state is GameEndedState) {
      // Clear saved game
      DatabaseService.deleteGameSession('thousand');
    }
  }

  void _onStartNewRound(
    StartNewRound event,
    Emitter<ThousandState> emit,
  ) {
    final currentState = state;
    List<Player> players = [];
    Map<int, ThousandPlayerData> playerData = {};
    int firstDealerIndex = 0;
    int currentDealerIndex = 0;
    int roundNumber = 1;

    if (currentState is ScoringPhaseState) {
      players = currentState.players;
      playerData = currentState.playerData;
      firstDealerIndex = currentState.firstDealerIndex;
      currentDealerIndex = currentState.currentDealerIndex;
      roundNumber = currentState.roundNumber;

      _saveStateForUndo();
    } else if (currentState is BarrelWarningState) {
      players = currentState.players;
      playerData = currentState.playerData;
      firstDealerIndex = currentState.firstDealerIndex;
      currentDealerIndex = currentState.currentDealerIndex;
      roundNumber = currentState.roundNumber;
    } else {
      return;
    }

    // Reset round data, but keep total scores
    final resetPlayerData = <int, ThousandPlayerData>{};
    for (int i = 0; i < players.length; i++) {
      final data = playerData[i]!;
      resetPlayerData[i] = ThousandPlayerData(
        totalScore: data.totalScore,
        isOnBarrel: data.isOnBarrel,
      );
    }

    // Start new round with new dealer
    final nextBidderIndex = (currentDealerIndex + 1) % players.length;

    emit(BiddingPhaseState(
      players: players,
      playerData: resetPlayerData,
      currentBidderIndex: nextBidderIndex,
      firstDealerIndex: firstDealerIndex,
      currentDealerIndex: currentDealerIndex,
      roundNumber: roundNumber + 1,
    ));

    // Save game state when starting new round
    add(SaveThousandGameSession());
  }

  void _onStartNewGameWithSamePlayers(
    StartNewGameWithSamePlayers event,
    Emitter<ThousandState> emit,
  ) {
    List<Player>? players;

    if (state is GameEndedState) {
      players = (state as GameEndedState).players;
    } else if (state is SelectingFirstDealerState) {
      players = (state as SelectingFirstDealerState).players;
    } else if (state is BiddingPhaseState) {
      players = (state as BiddingPhaseState).players;
    } else if (state is ScoringPhaseState) {
      players = (state as ScoringPhaseState).players;
    } else if (state is BarrelWarningState) {
      players = (state as BarrelWarningState).players;
    }

    if (players != null) {
      // Reset all players' scores
      for (var player in players) {
        player.score = 0;
      }

      _resetHistory();

      // Start new game
      add(StartThousandGame(players));
    }
  }

  void _onReturnToMenu(
    ReturnToMenu event,
    Emitter<ThousandState> emit,
  ) {
    _resetHistory();
    emit(ThousandInitial());
  }

  void _onSaveGameSession(
    SaveThousandGameSession event,
    Emitter<ThousandState> emit,
  ) async {
    try {
      // Delete any existing Thousand game sessions first
      await DatabaseService.deleteGameSession('thousand');

      // Prepare custom data based on current state
      Map<String, dynamic> customData = {};
      List<Player> players = [];
      Map<int, ThousandPlayerData> playerData = {};

      // Extract data based on current state type
      if (state is SelectingFirstDealerState) {
        final gameState = state as SelectingFirstDealerState;
        players = gameState.players;
        playerData = gameState.playerData;
        customData['phase'] = 'selectingFirstDealer';
      } else if (state is BiddingPhaseState) {
        final gameState = state as BiddingPhaseState;
        players = gameState.players;
        playerData = gameState.playerData;
        customData['phase'] = 'bidding';
        customData['currentBidderIndex'] = gameState.currentBidderIndex;
        customData['highestBid'] = gameState.highestBid;
        customData['highestBidderIndex'] = gameState.highestBidderIndex;
        customData['firstDealerIndex'] = gameState.firstDealerIndex;
        customData['currentDealerIndex'] = gameState.currentDealerIndex;
        customData['passedPlayers'] = gameState.passedPlayers.toList();
        customData['roundNumber'] = gameState.roundNumber;
      } else if (state is ScoringPhaseState) {
        final gameState = state as ScoringPhaseState;
        players = gameState.players;
        playerData = gameState.playerData;
        customData['phase'] = 'scoring';
        customData['bidWinnerIndex'] = gameState.bidWinnerIndex;
        customData['winningBid'] = gameState.winningBid;
        customData['firstDealerIndex'] = gameState.firstDealerIndex;
        customData['currentDealerIndex'] = gameState.currentDealerIndex;
        customData['enteredScores'] = gameState.enteredScores.map(
          (key, value) => MapEntry(key.toString(), value),
        );
        customData['currentScoreCalculation'] =
            gameState.currentScoreCalculation.map(
          (key, value) => MapEntry(key.toString(), value),
        );
        customData['bidderSuccess'] = gameState.bidderSuccess;
        customData['roundNumber'] = gameState.roundNumber;
      } else if (state is BarrelWarningState) {
        final gameState = state as BarrelWarningState;
        players = gameState.players;
        playerData = gameState.playerData;
        customData['phase'] = 'barrelWarning';
        customData['playersOnBarrel'] = gameState.playersOnBarrel;
        customData['firstDealerIndex'] = gameState.firstDealerIndex;
        customData['currentDealerIndex'] = gameState.currentDealerIndex;
        customData['roundNumber'] = gameState.roundNumber;
      } else {
        // Can't save other states
        return;
      }

      // Save player data
      customData['playerData'] = playerData.map((key, value) => MapEntry(
            key.toString(),
            {
              'roundScore': value.roundScore,
              'totalScore': value.totalScore,
              'tricksWon': value.tricksWon,
              'isOnBarrel': value.isOnBarrel,
              'hasBolt': value.hasBolt,
              'currentBid': value.currentBid,
            },
          ));

      // Save the current game session
      await DatabaseService.saveGameSession(
        gameType: 'thousand',
        scoreLimit: 1000, // Default score limit for Thousand
        gameMode: 'standard',
        players: players,
        playerScoreHistory: {}, // Thousand doesn't use the same score history as Uno
        customData: customData,
      );

      debugPrint('Thousand game session saved successfully');
    } catch (e) {
      debugPrint('Error saving Thousand game session: $e');
    }
  }

  void _onUndoAction(
    UndoThousandAction event,
    Emitter<ThousandState> emit,
  ) {
    if (_undoStack.isEmpty) return;

    final previousState = _undoStack.removeLast();
    final currentSnapshot = _cloneState(state);
    if (currentSnapshot != null) {
      _redoStack.add(currentSnapshot);
    } else {
      _redoStack.clear();
    }

    emit(previousState);
  }

  void _onRedoAction(
    RedoThousandAction event,
    Emitter<ThousandState> emit,
  ) {
    if (_redoStack.isEmpty) return;

    final nextState = _redoStack.removeLast();
    final currentSnapshot = _cloneState(state);
    if (currentSnapshot != null) {
      _undoStack.add(currentSnapshot);
    }

    emit(nextState);
  }

  void _resetHistory() {
    _undoStack.clear();
    _redoStack.clear();
  }

  void _saveStateForUndo() {
    if (state is! BiddingPhaseState && state is! ScoringPhaseState) {
      return;
    }

    final snapshot = _cloneState(state);
    if (snapshot != null) {
      _undoStack.add(snapshot);
      _redoStack.clear();
    }
  }

  ThousandState? _cloneState(ThousandState currentState) {
    if (currentState is BiddingPhaseState) {
      return BiddingPhaseState(
        players: _clonePlayers(currentState.players),
        playerData: _clonePlayerData(currentState.playerData),
        currentBidderIndex: currentState.currentBidderIndex,
        highestBid: currentState.highestBid,
        highestBidderIndex: currentState.highestBidderIndex,
        firstDealerIndex: currentState.firstDealerIndex,
        currentDealerIndex: currentState.currentDealerIndex,
        passedPlayers: Set<int>.from(currentState.passedPlayers),
        roundNumber: currentState.roundNumber,
      );
    } else if (currentState is ScoringPhaseState) {
      return ScoringPhaseState(
        players: _clonePlayers(currentState.players),
        playerData: _clonePlayerData(currentState.playerData),
        bidWinnerIndex: currentState.bidWinnerIndex,
        winningBid: currentState.winningBid,
        firstDealerIndex: currentState.firstDealerIndex,
        currentDealerIndex: currentState.currentDealerIndex,
        enteredScores: _cloneEnteredScores(currentState.enteredScores),
        currentScoreCalculation:
            Map<int, int>.from(currentState.currentScoreCalculation),
        bidderSuccess: currentState.bidderSuccess,
        roundNumber: currentState.roundNumber,
      );
    }
    return null;
  }

  List<Player> _clonePlayers(List<Player> players) {
    return players.map(_clonePlayer).toList();
  }

  Player _clonePlayer(Player player) {
    return Player(
      name: player.name,
      id: player.id,
      score: player.score,
      gear: player.gear,
      level: player.level,
      modifiers: _cloneModifiers(player.modifiers),
      isMale: player.isMale,
      isCursed: player.isCursed,
      temporaryModifier: player.temporaryModifier,
    );
  }

  PlayerModifiers _cloneModifiers(PlayerModifiers modifiers) {
    return PlayerModifiers(
      race1: modifiers.race1,
      race2: modifiers.race2,
      class1: modifiers.class1,
      class2: modifiers.class2,
      leftHand: modifiers.leftHand,
      twoHanded: modifiers.twoHanded,
      rightHand: modifiers.rightHand,
      firstBonus: modifiers.firstBonus,
      secondBonus: modifiers.secondBonus,
      headGear: modifiers.headGear,
      armour: modifiers.armour,
      boots: modifiers.boots,
    );
  }

  Map<int, ThousandPlayerData> _clonePlayerData(
    Map<int, ThousandPlayerData> data,
  ) {
    final cloned = <int, ThousandPlayerData>{};
    data.forEach((key, value) {
      cloned[key] = ThousandPlayerData(
        roundScore: value.roundScore,
        totalScore: value.totalScore,
        tricksWon: value.tricksWon,
        isOnBarrel: value.isOnBarrel,
        hasBolt: value.hasBolt,
        currentBid: value.currentBid,
      );
    });
    return cloned;
  }

  Map<int, int?> _cloneEnteredScores(Map<int, int?> source) {
    return Map<int, int?>.from(source);
  }

  bool canUndo() => _undoStack.isNotEmpty;

  bool canRedo() => _redoStack.isNotEmpty;

  void undo() {
    add(UndoThousandAction());
  }

  void redo() {
    add(RedoThousandAction());
  }
}
