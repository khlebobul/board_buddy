import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';

class InfoCatanDialog extends StatelessWidget {
  const InfoCatanDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      children: [
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.home,
          title: S.of(context).settlement,
          points: CatanCardsPoints.settlement,
          description: S.of(context).buildANewSettlementOnAnIntersection,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.city,
          title: S.of(context).city,
          points: CatanCardsPoints.city,
          description: S.of(context).upgradeASettlementToACity1Point,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.vp,
          title: S.of(context).victoryPointCard,
          points: CatanCardsPoints.victoryPointCard,
          description: S.of(context).developmentCardWorth1VictoryPoint,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.road,
          title: S.of(context).longestRoad,
          points: CatanCardsPoints.longestRoad,
          description: S.of(context).awardedToThePlayerWith5ConnectedRoads,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.army,
          title: S.of(context).largestArmy,
          points: CatanCardsPoints.largestArmy,
          description: S.of(context).awardedToThePlayerWith3KnightCardsPlayed,
        ),
      ],
    );
  }
}
