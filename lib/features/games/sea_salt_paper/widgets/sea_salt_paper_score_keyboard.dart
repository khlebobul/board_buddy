import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:not_static_icons/not_static_icons.dart';

class SeaSaltPaperScoreKeyboard extends StatelessWidget {
  final Function(int) onScoreUpdate;
  final VoidCallback onCollectionPressed;
  final VoidCallback onColorMajorityPressed;
  final VoidCallback onMermaidPressed;

  const SeaSaltPaperScoreKeyboard({
    super.key,
    required this.onScoreUpdate,
    required this.onCollectionPressed,
    required this.onColorMajorityPressed,
    required this.onMermaidPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return CustomKeyboard(
      buttons: [
        [
          KeyboardButton(
            buttonText: GameConst.plusOne,
            onPressed: () => onScoreUpdate(1),
          ),
          KeyboardButton(
            buttonText: GameConst.plusTwo,
            onPressed: () => onScoreUpdate(2),
          ),
          KeyboardButton(
            buttonText: GameConst.plusThree,
            onPressed: () => onScoreUpdate(3),
          ),
          KeyboardButton(
            buttonText: GameConst.plusFive,
            onPressed: () => onScoreUpdate(5),
          ),
        ],
        [
          KeyboardButton(
            buttonText: GameConst.plusSeven,
            onPressed: () => onScoreUpdate(7),
          ),
          KeyboardButton(
            icon: ShellIcon(),
            onPressed: onCollectionPressed,
          ),
          KeyboardButton(
            icon: PaletteIcon(),
            onPressed: onColorMajorityPressed,
          ),
          KeyboardButton(
            icon: CrownIcon(),
            onPressed: onMermaidPressed,
            textColor: theme.redColor,
          ),
        ],
      ],
    );
  }
}
