part of 'dos_bloc.dart';

@immutable
sealed class DosState {}

final class DosInitial extends DosState {}

final class DosStartScreenState extends DosState {
  final List<Player> players;
  final String selectedMode;
  final int scoreLimit;
  final bool isLoading;

  DosStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.scoreLimit,
    this.isLoading = false,
  });

  DosStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    int? scoreLimit,
    bool? isLoading,
  }) {
    return DosStartScreenState(
      players: players ?? this.players,
      selectedMode: selectedMode ?? this.selectedMode,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class DosGameState extends DosState {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;
  final int currentPlayerIndex;
  final Map<int, List<int>> playerScoreHistory;
  final Map<int, List<int>> playerRedoStack;
  final int lastScoreChange;
  final bool isScoreChanging;
  final bool gameEnded;

  DosGameState({
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

  DosGameState copyWith({
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
    return DosGameState(
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
