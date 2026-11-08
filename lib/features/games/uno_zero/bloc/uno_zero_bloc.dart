import 'package:bloc/bloc.dart';
import 'package:board_buddy/features/games/uno_zero/models/uno_zero_scoreboard.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/material.dart';

part 'uno_zero_event.dart';
part 'uno_zero_state.dart';

class UnoZeroBloc extends Bloc<UnoZeroEvent, UnoZeroState> {
  /// One queue for every UNO Zero bloc, so a disposed game cannot delete a
  /// newer game's checkpoint.
  static Future<void> _sessionWrites = Future<void>.value();

  UnoZeroBloc() : super(UnoZeroInitial()) {
    on<InitializeUnoZeroStartScreen>(_onInitializeStartScreen);
    on<AddUnoZeroPlayer>(_onAddPlayer);
    on<RemoveUnoZeroPlayer>(_onRemovePlayer);
    on<UpdateUnoZeroRounds>(_onUpdateRounds);
    on<CheckSavedUnoZeroGame>(_onCheckSavedGame);
    on<LoadSavedUnoZeroGame>(_onLoadSavedGame);
    on<DeleteSavedUnoZeroGame>(_onDeleteSavedGame);
    on<InitializeUnoZeroGame>(_onInitializeGame);
    on<ChangeUnoZeroCurrentPlayer>(_onChangeCurrentPlayer);
    on<EnterUnoZeroScore>(_onEnterScore);
    on<UndoUnoZeroScore>(_onUndo);
    on<RedoUnoZeroScore>(_onRedo);
    on<ContinueUnoZeroGame>(_onContinue);
    on<StartNewUnoZeroGameWithSamePlayers>(_onStartNewGameWithSamePlayers);
    on<ReturnUnoZeroToMenu>(_onReturnToMenu);
    on<MarkUnoZeroGameEndModalShown>(_onMarkGameEndModalShown);
    on<SaveUnoZeroGameSession>(_onSaveGameSession);
  }

  void _onInitializeStartScreen(
    InitializeUnoZeroStartScreen event,
    Emitter<UnoZeroState> emit,
  ) {
    emit(UnoZeroStartScreenState(players: []));
    add(CheckSavedUnoZeroGame());
  }

  void _onAddPlayer(AddUnoZeroPlayer event, Emitter<UnoZeroState> emit) {
    if (state is! UnoZeroStartScreenState) return;
    final current = state as UnoZeroStartScreenState;
    emit(current.copyWith(players: [...current.players, event.player]));
  }

  void _onRemovePlayer(RemoveUnoZeroPlayer event, Emitter<UnoZeroState> emit) {
    if (state is! UnoZeroStartScreenState) return;
    final current = state as UnoZeroStartScreenState;
    if (event.index < 0 || event.index >= current.players.length) return;
    final players = List<Player>.from(current.players)..removeAt(event.index);
    emit(current.copyWith(players: players));
  }

  void _onUpdateRounds(UpdateUnoZeroRounds event, Emitter<UnoZeroState> emit) {
    if (state is! UnoZeroStartScreenState) return;
    final current = state as UnoZeroStartScreenState;
    final rounds = event.totalRounds.clamp(
      UnoZeroScoreboard.minRounds,
      UnoZeroScoreboard.maxRounds,
    );
    emit(current.copyWith(totalRounds: rounds));
  }

  Future<void> _onCheckSavedGame(
    CheckSavedUnoZeroGame event,
    Emitter<UnoZeroState> emit,
  ) async {
    if (state is! UnoZeroStartScreenState) return;
    final hasSavedGame = await DatabaseService.hasGameSession(
      UnoZeroScoreboard.gameType,
    );
    if (state is! UnoZeroStartScreenState) return;
    final current = state as UnoZeroStartScreenState;
    emit(current.copyWith(hasSavedGame: hasSavedGame));
  }

  Future<void> _onLoadSavedGame(
    LoadSavedUnoZeroGame event,
    Emitter<UnoZeroState> emit,
  ) async {
    try {
      final gameData = await DatabaseService.getLatestGameSession(
        UnoZeroScoreboard.gameType,
      );
      if (gameData == null) {
        emit(UnoZeroLoadFailed());
        return;
      }

      final session = Map<String, dynamic>.from(gameData['session'] as Map);
      final players = List<Player>.from(gameData['players'] as List<Player>);
      final scoreboard = UnoZeroScoreboard.fromJson(session);
      if (players.length != scoreboard.playerCount) {
        emit(UnoZeroLoadFailed());
        return;
      }
      emit(
        UnoZeroGameState(
          players: _withTotals(players, scoreboard),
          scoreboard: scoreboard,
          gameEnded: scoreboard.isComplete,
        ),
      );
    } catch (error) {
      debugPrint('Error loading uno zero session: $error');
      emit(UnoZeroLoadFailed());
    }
  }

  Future<void> _onDeleteSavedGame(
    DeleteSavedUnoZeroGame event,
    Emitter<UnoZeroState> emit,
  ) async {
    await _enqueueSessionWrite(() async {
      await DatabaseService.deleteGameSession(UnoZeroScoreboard.gameType);
      if (isClosed || emit.isDone) return;
      if (state is UnoZeroStartScreenState) {
        final current = state as UnoZeroStartScreenState;
        emit(current.copyWith(hasSavedGame: false));
      }
    });
  }

  void _onInitializeGame(
    InitializeUnoZeroGame event,
    Emitter<UnoZeroState> emit,
  ) {
    final scoreboard = UnoZeroScoreboard.initial(
      playerCount: event.players.length,
      totalRounds: event.totalRounds,
    );
    emit(
      UnoZeroGameState(
        players: _withTotals(event.players, scoreboard),
        scoreboard: scoreboard,
      ),
    );
  }

  void _onChangeCurrentPlayer(
    ChangeUnoZeroCurrentPlayer event,
    Emitter<UnoZeroState> emit,
  ) {
    if (state is! UnoZeroGameState) return;
    final current = state as UnoZeroGameState;
    emit(current.copyWith(currentPlayerIndex: event.playerIndex));
  }

  void _onEnterScore(EnterUnoZeroScore event, Emitter<UnoZeroState> emit) {
    if (state is! UnoZeroGameState) return;
    final current = state as UnoZeroGameState;
    final scoreboard = current.scoreboard.enterScore(
      event.playerIndex,
      event.score,
    );
    if (identical(scoreboard, current.scoreboard)) return;

    final ended = scoreboard.isComplete;
    emit(
      current.copyWith(
        players: _withTotals(current.players, scoreboard),
        scoreboard: scoreboard,
        gameEnded: ended,
        hasShownGameEndModal: ended ? false : current.hasShownGameEndModal,
      ),
    );
    if (ended) {
      add(DeleteSavedUnoZeroGame());
    } else {
      add(SaveUnoZeroGameSession());
    }
  }

  void _onUndo(UndoUnoZeroScore event, Emitter<UnoZeroState> emit) {
    _replaceScoreboard(emit, (board) => board.undo());
  }

  void _onRedo(RedoUnoZeroScore event, Emitter<UnoZeroState> emit) {
    _replaceScoreboard(emit, (board) => board.redo());
  }

  void _replaceScoreboard(
    Emitter<UnoZeroState> emit,
    UnoZeroScoreboard Function(UnoZeroScoreboard board) update,
  ) {
    if (state is! UnoZeroGameState) return;
    final current = state as UnoZeroGameState;
    final scoreboard = update(current.scoreboard);
    if (identical(scoreboard, current.scoreboard)) return;
    emit(
      current.copyWith(
        players: _withTotals(current.players, scoreboard),
        scoreboard: scoreboard,
        gameEnded: scoreboard.isComplete,
      ),
    );
    if (scoreboard.isComplete) {
      add(DeleteSavedUnoZeroGame());
    } else {
      add(SaveUnoZeroGameSession());
    }
  }

  void _onContinue(ContinueUnoZeroGame event, Emitter<UnoZeroState> emit) {
    if (state is! UnoZeroGameState) return;
    final current = state as UnoZeroGameState;
    final scoreboard = current.scoreboard.isComplete
        ? current.scoreboard.continuePastEnd()
        : current.scoreboard;
    emit(
      current.copyWith(
        players: _withTotals(current.players, scoreboard),
        scoreboard: scoreboard,
        gameEnded: false,
        hasShownGameEndModal: false,
      ),
    );
    add(SaveUnoZeroGameSession());
  }

  void _onStartNewGameWithSamePlayers(
    StartNewUnoZeroGameWithSamePlayers event,
    Emitter<UnoZeroState> emit,
  ) {
    if (state is! UnoZeroGameState) return;
    final current = state as UnoZeroGameState;
    final scoreboard = current.scoreboard.reset();
    emit(
      UnoZeroGameState(
        players: _withTotals(current.players, scoreboard),
        scoreboard: scoreboard,
      ),
    );
    add(DeleteSavedUnoZeroGame());
  }

  void _onReturnToMenu(ReturnUnoZeroToMenu event, Emitter<UnoZeroState> emit) {
    add(DeleteSavedUnoZeroGame());
    emit(UnoZeroInitial());
  }

  void _onMarkGameEndModalShown(
    MarkUnoZeroGameEndModalShown event,
    Emitter<UnoZeroState> emit,
  ) {
    if (state is! UnoZeroGameState) return;
    final current = state as UnoZeroGameState;
    emit(current.copyWith(hasShownGameEndModal: true));
  }

  Future<void> _onSaveGameSession(
    SaveUnoZeroGameSession event,
    Emitter<UnoZeroState> emit,
  ) async {
    await _enqueueSessionWrite(() async {
      if (state is! UnoZeroGameState) return;
      final current = state as UnoZeroGameState;
      if (current.scoreboard.isComplete) return;
      try {
        await DatabaseService.replaceGameSession(
          gameType: UnoZeroScoreboard.gameType,
          scoreLimit: current.scoreboard.totalRounds,
          gameMode: 'lowest_score',
          players: current.players,
          playerScoreHistory: {
            for (var i = 0; i < current.players.length; i++)
              i: current.scoreboard.previousScores(i),
          },
          customData: current.scoreboard.toJson(),
        );
      } catch (error) {
        debugPrint('Error saving uno zero session: $error');
      }
    });
  }

  Future<void> _enqueueSessionWrite(Future<void> Function() action) {
    final operation = _sessionWrites.catchError((_) {}).then((_) => action());
    _sessionWrites = operation;
    return operation;
  }

  List<Player> _withTotals(List<Player> players, UnoZeroScoreboard scoreboard) {
    return [
      for (var i = 0; i < players.length; i++)
        Player(
          name: players[i].name,
          id: players[i].id,
          score: scoreboard.total(i),
        ),
    ];
  }
}
