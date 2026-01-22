import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';
import 'package:not_static_icons/not_static_icons.dart';

class InfoUnoDialog extends StatelessWidget {
  const InfoUnoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      children: [
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
          cardName: GameConst.plusTwo,
          title: S.of(context).drawTwoCardUnoInfo,
          points: GameConst.twenty,
          description:
              S.of(context).nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo,
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
          points: GameConst.fifty,
          description: S.of(context).allowsThePlayerToChooseTheColorUnoInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: GridPlus4Icon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).wildDrawFourCardUnoInfo,
          points: GameConst.fifty,
          description:
              S.of(context).changesTheColorAndForcesTheNextPlayerToDrawUnoInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: ReplaceIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).wildShuffleHandsCardUnoInfo,
          points: GameConst.fifty,
          description:
              S.of(context).swapHandsWithAnyPlayerAndChooseTheColorUnoInfo,
        ),
        InfoRowWidget(
          context: context,
          title: S.of(context).numberCards,
          points: GameConst.zeroToNine,
          description: S.of(context).eachCardHasANumberFrom0To9WhichUnoInfo,
        ),
      ],
    );
  }
}
