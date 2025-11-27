import 'package:board_buddy/features/games/common_counter/widgets/game_end_common_counter_modal.dart';
import 'package:board_buddy/features/games/thousand/models/thousand_models.dart';
import 'package:board_buddy/features/games/thousand/widgets/game_end_thousand_modal_widget.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/game_widgets/game_end_uno_modal_widget.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:flutter/material.dart';

/// Helper class to show game end modals with unified logic
/// Reduces code duplication across different game screens
class GameEndModalHelper {
  /// Show game end modal for UNO/DOS/UNO_FLIP style games
  /// These games have a score limit and game mode
  static void showUnoStyleModal({
    required BuildContext context,
    required List<Player> players,
    required String gameMode,
    required int scoreLimit,
    required int maxPlayers,
    required VoidCallback onContinueGame,
    required VoidCallback onNewGameWithSamePlayers,
    required VoidCallback onNewGame,
    required VoidCallback onReturnToMenu,
    required void Function(Player player) onAddPlayerToBloc,
    required Function(List<Player> players, String gameMode, int scoreLimit)
        onReopenModal,
  }) {
    GameEndUnoModalWidget.show(
      context,
      players: players,
      gameMode: gameMode,
      scoreLimit: scoreLimit,
      onContinueGame: () {
        onContinueGame();
        Navigator.pop(context);
      },
      onNewGameWithSamePlayers: () {
        onNewGameWithSamePlayers();
        Navigator.pop(context);
      },
      onNewGame: () {
        onNewGame();
        Navigator.pop(context);
        Navigator.pop(context);
      },
      onReturnToMenu: () {
        onReturnToMenu();
        Navigator.pushNamed(context, '/home');
      },
      onAddPlayer: players.length < maxPlayers
          ? () {
              AddPlayerDialog.show(context, onPlayerAdded: (newPlayer) {
                onAddPlayerToBloc(newPlayer);
                Navigator.pop(context);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  onReopenModal(
                    List<Player>.from(players)..add(newPlayer),
                    gameMode,
                    scoreLimit,
                  );
                });
              });
            }
          : null,
    );
  }

  /// Show game end modal for Common Counter/Scrabble/Set style games
  /// These games use a single player mode flag
  static void showCommonCounterStyleModal({
    required BuildContext context,
    required List<Player> players,
    required bool isSinglePlayer,
    required int maxPlayers,
    required VoidCallback onContinue,
    required VoidCallback onNewRound,
    required VoidCallback onNewGame,
    required VoidCallback onReturnToMenu,
    required void Function(Player player) onAddPlayerToBloc,
    required Function(BuildContext context, List<Player> players)
        onReopenModal,
  }) {
    GameEndCommonCounterModal.show(
      context,
      players: players,
      isSinglePlayer: isSinglePlayer,
      onContinue: () {
        Navigator.of(context).pop();
        onContinue();
      },
      onNewRound: () {
        Navigator.of(context).pop();
        onNewRound();
      },
      onNewGame: () {
        Navigator.of(context).pop();
        onNewGame();
      },
      onReturnToMenu: () {
        onReturnToMenu();
      },
      onAddPlayer: !isSinglePlayer && players.length < maxPlayers
          ? () {
              AddPlayerDialog.show(context, onPlayerAdded: (newPlayer) {
                onAddPlayerToBloc(newPlayer);
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final updatedPlayers = List<Player>.from(players)
                    ..add(newPlayer);
                  onReopenModal(context, updatedPlayers);
                });
              });
            }
          : null,
    );
  }

  /// Show game end modal for Thousand game
  /// This game has unique player data structure
  static void showThousandStyleModal({
    required BuildContext context,
    required List<Player> players,
    required Map<int, ThousandPlayerData> playerData,
    required int? winnerIndex,
    VoidCallback? onContinueGame,
    required VoidCallback onNewGameWithSamePlayers,
    required VoidCallback onNewGame,
    required VoidCallback onReturnToMenu,
  }) {
    GameEndThousandModalWidget.show(
      context,
      players: players,
      playerData: playerData,
      winnerIndex: winnerIndex,
      onContinueGame: onContinueGame != null
          ? () {
              Navigator.of(context).pop();
              onContinueGame();
            }
          : null,
      onNewGameWithSamePlayers: () {
        Navigator.of(context).pop();
        onNewGameWithSamePlayers();
      },
      onNewGame: () {
        Navigator.of(context).pop();
        onNewGame();
      },
      onReturnToMenu: () {
        Navigator.of(context).pop();
        onReturnToMenu();
      },
    );
  }
}
