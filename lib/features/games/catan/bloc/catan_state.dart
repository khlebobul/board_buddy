part of 'catan_bloc.dart';

@immutable
sealed class CatanState {}

final class CatanInitial extends CatanState {}

final class CatanStartScreenState extends CatanState {
  final List<Player> players;
  final String selectedMode;
  final int scoreLimit;
  final bool isLoading;
  final bool hasSavedGame;

  CatanStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.scoreLimit,
    this.isLoading = false,
    this.hasSavedGame = false,
  });

  CatanStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    int? scoreLimit,
    bool? isLoading,
    bool? hasSavedGame,
  }) {
    return CatanStartScreenState(
      players: players ?? this.players,
      selectedMode: selectedMode ?? this.selectedMode,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      isLoading: isLoading ?? this.isLoading,
      hasSavedGame: hasSavedGame ?? this.hasSavedGame,
    );
  }
}

final class CatanGameState extends CatanState {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;
  final int currentPlayerIndex;
  final Map<int, List<int>> playerScoreHistory;
  final Map<int, List<int>> playerRedoStack;
  final int lastScoreChange;
  final bool isScoreChanging;
  final bool gameEnded;
  final bool hasShownGameEndModal;

  CatanGameState({
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
    this.currentPlayerIndex = 0,
    Map<int, List<int>>? playerScoreHistory,
    Map<int, List<int>>? playerRedoStack,
    this.lastScoreChange = 0,
    this.isScoreChanging = false,
    this.gameEnded = false,
    this.hasShownGameEndModal = false,
  })  : playerScoreHistory = playerScoreHistory ?? {},
        playerRedoStack = playerRedoStack ?? {};

  CatanGameState copyWith({
    List<Player>? players,
    int? scoreLimit,
    String? gameMode,
    int? currentPlayerIndex,
    Map<int, List<int>>? playerScoreHistory,
    Map<int, List<int>>? playerRedoStack,
    int? lastScoreChange,
    bool? isScoreChanging,
    bool? gameEnded,
    bool? hasShownGameEndModal,
  }) {
    return CatanGameState(
      players: players ?? this.players,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      gameMode: gameMode ?? this.gameMode,
      currentPlayerIndex: currentPlayerIndex ?? this.currentPlayerIndex,
      playerScoreHistory: playerScoreHistory ?? this.playerScoreHistory,
      playerRedoStack: playerRedoStack ?? this.playerRedoStack,
      lastScoreChange: lastScoreChange ?? this.lastScoreChange,
      isScoreChanging: isScoreChanging ?? this.isScoreChanging,
      gameEnded: gameEnded ?? this.gameEnded,
      hasShownGameEndModal: hasShownGameEndModal ?? this.hasShownGameEndModal,
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
