import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';
import 'package:not_static_icons/not_static_icons.dart';

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
          icon: HouseIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).settlement,
          points: CatanCardsPoints.settlement,
          description: S.of(context).buildANewSettlementOnAnIntersection,
        ),
        InfoRowWidget(
          context: context,
          icon: Building2Icon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).city,
          points: CatanCardsPoints.city,
          description: S.of(context).upgradeASettlementToACity1Point,
        ),
        InfoRowWidget(
          context: context,
          icon: VictoryPointsIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).victoryPointCard,
          points: CatanCardsPoints.victoryPointCard,
          description: S.of(context).developmentCardWorth1VictoryPoint,
        ),
        InfoRowWidget(
          context: context,
          icon: RoadIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).longestRoad,
          points: CatanCardsPoints.longestRoad,
          description: S.of(context).awardedToThePlayerWith5ConnectedRoads,
        ),
        InfoRowWidget(
          context: context,
          icon: SwordsIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).largestArmy,
          points: CatanCardsPoints.largestArmy,
          description: S.of(context).awardedToThePlayerWith3KnightCardsPlayed,
        ),
        InfoRowWidget(
          context: context,
          icon: BoxIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          description: S.of(context).rollDiceLocale,
        ),
        InfoRowWidget(
          context: context,
          icon: MapPlusIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          description: S.of(context).mapGenerator,
        ),
      ],
    );
  }
}
