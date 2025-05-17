part of 'carcassonne_bloc.dart';

@immutable
abstract class CarcassonneState {}

class CarcassonneInitial extends CarcassonneState {}

class CarcassonneStartScreenState extends CarcassonneState {
  final String selectedMode;
  final bool isAutomatic;

  CarcassonneStartScreenState({
    required this.selectedMode,
    required this.isAutomatic,
  });

  CarcassonneStartScreenState copyWith({
    String? selectedMode,
    bool? isAutomatic,
  }) {
    return CarcassonneStartScreenState(
      selectedMode: selectedMode ?? this.selectedMode,
      isAutomatic: isAutomatic ?? this.isAutomatic,
    );
  }
}

class CarcassonneGameState extends CarcassonneState {
  final bool isAutomatic;
  final int score;

  CarcassonneGameState({
    required this.isAutomatic,
    this.score = 0,
  });

  CarcassonneGameState copyWith({
    bool? isAutomatic,
    int? score,
  }) {
    return CarcassonneGameState(
      isAutomatic: isAutomatic ?? this.isAutomatic,
      score: score ?? this.score,
    );
  }
}
