import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/home/widgets/add_new_game.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).rules,
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
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pushNamed(context, '/unoRules'),
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
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pushNamed(context, '/scrabbleRules'),
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
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pushNamed(context, '/unoFlipRules'),
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
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pushNamed(context, '/dosRules'),
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
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pushNamed(context, '/setRules'),
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
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pushNamed(context, '/munchkinRules'),
                child: TextScramble(
                    text: '06 - ${S.of(context).munchkin}',
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display3,
                      );
                    }),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pushNamed(context, '/thousandRules'),
                child: TextScramble(
                    text: '07 - 1000',
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
