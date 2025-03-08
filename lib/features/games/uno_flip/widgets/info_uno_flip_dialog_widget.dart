import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class InfoUnoFlipDialog extends StatelessWidget {
  const InfoUnoFlipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: TextScramble(
                  text: S.of(context).close,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InfoRowWidget(
                    context: context,
                    cardName: GameConst.plusOne,
                    title: S.of(context).drawOneUnoFlipInfo,
                    points: GameConst.ten,
                    description: S
                        .of(context)
                        .nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.reverse,
                    title: S.of(context).reverseCardUnoInfo,
                    points: GameConst.twenty,
                    description: S.of(context).changesTheDirectionOfPlayUnoInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.skip,
                    title: S.of(context).skipCardUnoInfo,
                    points: GameConst.twenty,
                    description: S.of(context).skipsTheNextPlayersTurnUnoInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.wild,
                    title: S.of(context).wildCardUnoInfo,
                    points: GameConst.forty,
                    description:
                        S.of(context).allowsThePlayerToChooseTheColorUnoInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.wildDrawTwoUnoflip,
                    title: S.of(context).drawTwoCardUnoInfo,
                    points: GameConst.fifty,
                    description: S
                        .of(context)
                        .nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.flip,
                    title: S.of(context).flipCardUnoFlipInfo,
                    points: GameConst.twenty,
                    description:
                        S.of(context).flipsAllCardsToTheOppositeSideUnoFlipInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    cardName: GameConst.plusFive,
                    title: S.of(context).drawFiveUnoFlipInfo,
                    points: GameConst.forty,
                    description: S
                        .of(context)
                        .nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.skipEveryone,
                    title: S.of(context).skipEveryoneCardUnoFlipInfo,
                    points: GameConst.thirty,
                    description: S
                        .of(context)
                        .skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.wildDrawColor,
                    title: S.of(context).wildDrawColorUnoFlipInfo,
                    points: GameConst.sixty,
                    description: S
                        .of(context)
                        .nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    title: S.of(context).numberCards,
                    points: GameConst.oneToNine,
                    description: S.of(context).eachCardHasANumberFrom1To9Which,
                  ),
                  InfoRowWidget(
                    context: context,
                    title: S.of(context).flipSide,
                    iconPath: CustomIcons.sun,
                    description: S.of(context).darkSideCardsAreReplacedWithLightOnesAndVice,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
