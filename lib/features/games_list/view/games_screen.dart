import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/pressable.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final games = [
      ('00 - ${S.of(context).common}', '/commonStartGame'),
      ('01 - ${GameNames.uno}', '/unoStartGame'),
      ('02 - ${GameNames.scrabble}', '/scrabbleStartGame'),
      ('03 - ${GameNames.unoFlip}', '/unoFlipStartGame'),
      ('04 - ${GameNames.dos}', '/dosStartGame'),
      ('05 - ${GameNames.set}', '/setStartGame'),
      ('06 - ${GameNames.munchkin}', '/munchkinStartGame'),
      ('07 - 1000', '/thousandStartGame'),
      ('08 - ${GameNames.catan}', '/catanStartGame'),
      ('09 - ${GameNames.seaSaltPaper}', '/seaSaltPaperStartGame'),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).games,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
                  horizontal: GeneralConst.paddingHorizontal) +
              const EdgeInsets.only(top: GeneralConst.paddingVertical),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final game in games) ...[
                Pressable(
                  onTap: () => Navigator.pushNamed(context, game.$2),
                  child: TextScramble(
                    text: game.$1,
                    builder: (context, scrambledText) {
                      return Text(scrambledText, style: theme.display3);
                    },
                  ),
                ),
                const SizedBox(height: 5),
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
