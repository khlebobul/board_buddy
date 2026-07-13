import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/pressable.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final rules = [
      ('01 - ${GameNames.uno}', '/unoRules'),
      ('02 - ${GameNames.scrabble}', '/scrabbleRules'),
      ('03 - ${GameNames.unoFlip}', '/unoFlipRules'),
      ('04 - ${GameNames.dos}', '/dosRules'),
      ('05 - ${GameNames.set}', '/setRules'),
      ('06 - ${GameNames.munchkin}', '/munchkinRules'),
      ('07 - 1000', '/thousandRules'),
      ('08 - ${GameNames.catan}', '/catanRules'),
      ('09 - ${GameNames.seaSaltPaper}', '/seaSaltPaperRules'),
    ];

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
              for (final rule in rules) ...[
                Pressable(
                  onTap: () => Navigator.pushNamed(context, rule.$2),
                  child: TextScramble(
                    text: rule.$1,
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
