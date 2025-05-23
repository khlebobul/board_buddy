import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/home/widgets/add_new_game.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
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
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/commonStartGame'),
                child: TextScramble(
                    text: '00 - ${S.of(context).common}',
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display3,
                      );
                    }),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/unoStartGame'),
                child: TextScramble(
                    text: '01 - ${S.of(context).uno}',
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display3,
                      );
                    }),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/scrabbleStartGame'),
                child: TextScramble(
                    text: '02 - ${S.of(context).scrabble}',
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display3,
                      );
                    }),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/unoFlipStartGame'),
                child: TextScramble(
                    text: '03 - ${S.of(context).unoFlip}',
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display3,
                      );
                    }),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/dosStartGame'),
                child: TextScramble(
                    text: '04 - ${S.of(context).dos}',
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display3,
                      );
                    }),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/setStartGame'),
                child: TextScramble(
                    text: '05 - ${S.of(context).set}',
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display3,
                      );
                    }),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/munchkinStartGame'),
                child: TextScramble(
                    text: '06 - ${S.of(context).munchkin}',
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display3,
                      );
                    }),
              ),
              const Spacer(),
              const AddFavouriteGame(),
            ],
          ),
        ),
      ),
    );
  }
}
