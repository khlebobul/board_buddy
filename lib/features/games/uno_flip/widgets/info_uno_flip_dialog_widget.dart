import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';
import 'package:not_static_icons/not_static_icons.dart';

class InfoUnoFlipDialog extends StatelessWidget {
  const InfoUnoFlipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      maxHeightFactor: 0.85, // This dialog has more content
      children: [
        InfoRowWidget(
          context: context,
          cardName: GameConst.plusOne,
          title: S.of(context).drawOneUnoFlipInfo,
          points: GameConst.ten,
          description:
              S.of(context).nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: RepeatIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).reverseCardUnoInfo,
          points: GameConst.twenty,
          description: S.of(context).changesTheDirectionOfPlayUnoInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: BanIcon(
            animationDuration: Duration(milliseconds: 450),
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).skipCardUnoInfo,
          points: GameConst.twenty,
          description: S.of(context).skipsTheNextPlayersTurnUnoInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: Grid2x2Icon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).wildCardUnoInfo,
          points: GameConst.forty,
          description: S.of(context).allowsThePlayerToChooseTheColorUnoInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: GridPlus2Icon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).drawTwoCardUnoInfo,
          points: GameConst.fifty,
          description:
              S.of(context).nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: Replace2Icon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).flipCardUnoFlipInfo,
          points: GameConst.twenty,
          description: S.of(context).flipsAllCardsToTheOppositeSideUnoFlipInfo,
        ),
        InfoRowWidget(
          context: context,
          cardName: GameConst.plusFive,
          title: S.of(context).drawFiveUnoFlipInfo,
          points: GameConst.twenty,
          description:
              S.of(context).nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: RotateCwIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).skipEveryoneCardUnoFlipInfo,
          points: GameConst.thirty,
          description: S
              .of(context)
              .skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: LayersIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
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
          icon: SunIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          description:
              S.of(context).darkSideCardsAreReplacedWithLightOnesAndVice,
        ),
      ],
    );
  }
}
