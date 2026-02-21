import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';

class SeaSaltPaperScoreKeyboard extends StatefulWidget {
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
  State<SeaSaltPaperScoreKeyboard> createState() =>
      _SeaSaltPaperScoreKeyboardState();
}

class _SeaSaltPaperScoreKeyboardState extends State<SeaSaltPaperScoreKeyboard> {
  final _shellController = AnimatedIconController();
  final _paletteController = AnimatedIconController();
  final _crownController = AnimatedIconController();

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return CustomKeyboard(
      buttons: [
        [
          KeyboardButton(
            buttonText: GameConst.plusOne,
            onPressed: () {
              widget.onScoreUpdate(1);
              Gaimon.soft();
            },
          ),
          KeyboardButton(
            buttonText: GameConst.plusTwo,
            onPressed: () {
              widget.onScoreUpdate(2);
              Gaimon.soft();
            },
          ),
          KeyboardButton(
            buttonText: GameConst.plusThree,
            onPressed: () {
              widget.onScoreUpdate(3);
              Gaimon.soft();
            },
          ),
          KeyboardButton(
            buttonText: GameConst.plusFive,
            onPressed: () {
              widget.onScoreUpdate(5);
              Gaimon.soft();
            },
          ),
        ],
        [
          KeyboardButton(
            buttonText: GameConst.plusSeven,
            onPressed: () {
              widget.onScoreUpdate(7);
              Gaimon.soft();
            },
          ),
          KeyboardButton(
            icon: ShellIcon(
              color: theme.textColor,
              size: 24,
              strokeWidth: 1,
              hoverColor: theme.secondaryTextColor,
              interactive: false,
              controller: _shellController,
            ),
            onPressed: () {
              _shellController.animate();
              widget.onCollectionPressed();
              Gaimon.soft();
            },
          ),
          KeyboardButton(
            icon: PaletteIcon(
              color: theme.textColor,
              size: 24,
              strokeWidth: 1,
              hoverColor: theme.secondaryTextColor,
              interactive: false,
              controller: _paletteController,
            ),
            onPressed: () {
              _paletteController.animate();
              widget.onColorMajorityPressed();
              Gaimon.soft();
            },
          ),
          KeyboardButton(
            icon: CrownIcon(
              color: theme.redColor,
              size: 24,
              strokeWidth: 1,
              hoverColor: theme.secondaryTextColor,
              interactive: false,
              controller: _crownController,
            ),
            onPressed: () {
              _crownController.animate();
              widget.onMermaidPressed();
              Gaimon.soft();
            },
          ),
        ],
      ],
    );
  }
}
