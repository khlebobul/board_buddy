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

final class SeaSaltPaperGameState extends SeaSaltPaperState {
  final List<Player> players;
  final int scoreLimit;
  final int currentPlayerIndex;
  final Map<int, List<int>> playerScoreHistory;
  final Map<int, List<int>> playerRedoStack;
  final int lastScoreChange;
  final bool isScoreChanging;
  final bool gameEnded;
  final bool hasShownGameEndModal;
  final bool mermaidVictory;

  SeaSaltPaperGameState({
    required this.players,
    required this.scoreLimit,
    this.currentPlayerIndex = 0,
    Map<int, List<int>>? playerScoreHistory,
    Map<int, List<int>>? playerRedoStack,
    this.lastScoreChange = 0,
    this.isScoreChanging = false,
    this.gameEnded = false,
    this.hasShownGameEndModal = false,
    this.mermaidVictory = false,
  })  : playerScoreHistory = playerScoreHistory ?? {},
        playerRedoStack = playerRedoStack ?? {};

  SeaSaltPaperGameState copyWith({
    List<Player>? players,
    int? scoreLimit,
    int? currentPlayerIndex,
    Map<int, List<int>>? playerScoreHistory,
    Map<int, List<int>>? playerRedoStack,
    int? lastScoreChange,
    bool? isScoreChanging,
    bool? gameEnded,
    bool? hasShownGameEndModal,
    bool? mermaidVictory,
  }) {
    return SeaSaltPaperGameState(
      players: players ?? this.players,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      currentPlayerIndex: currentPlayerIndex ?? this.currentPlayerIndex,
      playerScoreHistory: playerScoreHistory ?? this.playerScoreHistory,
      playerRedoStack: playerRedoStack ?? this.playerRedoStack,
      lastScoreChange: lastScoreChange ?? this.lastScoreChange,
      isScoreChanging: isScoreChanging ?? this.isScoreChanging,
      gameEnded: gameEnded ?? this.gameEnded,
      hasShownGameEndModal: hasShownGameEndModal ?? this.hasShownGameEndModal,
      mermaidVictory: mermaidVictory ?? this.mermaidVictory,
    );
  }

  bool canUndo() {
    final currentPlayerHistory = playerScoreHistory[currentPlayerIndex];
    return currentPlayerHistory != null && currentPlayerHistory.isNotEmpty;
  }

  bool canRedo() {
    final currentPlayerRedoStack = playerRedoStack[currentPlayerIndex];
    return currentPlayerRedoStack != null && currentPlayerRedoStack.isNotEmpty;
  }
}
