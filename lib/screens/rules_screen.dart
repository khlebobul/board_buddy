import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/widgets/app_widgets/add_new_game.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 12) +
              const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/unoRules'),
                child: TextScramble(
                  text: '01 - ${S.of(context).uno}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/scrabbleRules'),
                child: TextScramble(
                  text: '02 - ${S.of(context).scrabble}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/unoFlipRules'),
                child: TextScramble(
                  text: '03 - ${S.of(context).unoFlip}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/dosRules'),
                child: TextScramble(
                  text: '04 - ${S.of(context).dos}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/setRules'),
                child: TextScramble(
                  text: '05 - ${S.of(context).set}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/munchkinRules'),
                child: TextScramble(
                  text: '06 - ${S.of(context).munchkin}',
                  style: theme.display3,
                ),
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
