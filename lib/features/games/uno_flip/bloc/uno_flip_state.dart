part of 'uno_flip_bloc.dart';

@immutable
sealed class UnoFlipState {}

final class UnoFlipInitial extends UnoFlipState {}

final class UnoFlipStartScreenState extends UnoFlipState {
  final List<Player> players;
  final String selectedMode;
  final int scoreLimit;
  final bool isLoading;

  UnoFlipStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.scoreLimit,
    this.isLoading = false,
  });

  UnoFlipStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    int? scoreLimit,
    bool? isLoading,
  }) {
    return UnoFlipStartScreenState(
      players: players ?? this.players,
      selectedMode: selectedMode ?? this.selectedMode,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class UnoFlipGameState extends UnoFlipState {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;
  final int currentPlayerIndex;
  final Map<int, List<int>> playerScoreHistory;
  final Map<int, List<int>> playerRedoStack;
  final int lastScoreChange;
  final bool isScoreChanging;
  final bool gameEnded;

  UnoFlipGameState({
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
    this.currentPlayerIndex = 0,
    Map<int, List<int>>? playerScoreHistory,
    Map<int, List<int>>? playerRedoStack,
    this.lastScoreChange = 0,
    this.isScoreChanging = false,
    this.gameEnded = false,
  })  : playerScoreHistory = playerScoreHistory ?? {},
        playerRedoStack = playerRedoStack ?? {};

  UnoFlipGameState copyWith({
    List<Player>? players,
    int? scoreLimit,
    String? gameMode,
    int? currentPlayerIndex,
    Map<int, List<int>>? playerScoreHistory,
    Map<int, List<int>>? playerRedoStack,
    int? lastScoreChange,
    bool? isScoreChanging,
    bool? gameEnded,
  }) {
    return UnoFlipGameState(
      players: players ?? this.players,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      gameMode: gameMode ?? this.gameMode,
      currentPlayerIndex: currentPlayerIndex ?? this.currentPlayerIndex,
      playerScoreHistory: playerScoreHistory ?? this.playerScoreHistory,
      playerRedoStack: playerRedoStack ?? this.playerRedoStack,
      lastScoreChange: lastScoreChange ?? this.lastScoreChange,
      isScoreChanging: isScoreChanging ?? this.isScoreChanging,
      gameEnded: gameEnded ?? this.gameEnded,
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

