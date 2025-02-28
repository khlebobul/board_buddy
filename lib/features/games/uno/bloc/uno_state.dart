part of 'uno_bloc.dart';

@immutable
sealed class UnoState {}

final class UnoInitial extends UnoState {}

final class UnoStartScreenState extends UnoState {
  final List<Player> players;
  final String selectedMode;
  final int scoreLimit;
  final bool isLoading;

  UnoStartScreenState({
    required this.players,
    required this.selectedMode,
    required this.scoreLimit,
    this.isLoading = false,
  });

  UnoStartScreenState copyWith({
    List<Player>? players,
    String? selectedMode,
    int? scoreLimit,
    bool? isLoading,
  }) {
    return UnoStartScreenState(
      players: players ?? this.players,
      selectedMode: selectedMode ?? this.selectedMode,
      scoreLimit: scoreLimit ?? this.scoreLimit,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
