import 'package:board_buddy/features/about/widgets/link_btn.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:flutter/material.dart';

class CarcassonneRulesScreen extends StatelessWidget {
  const CarcassonneRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).carcassonne,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: BlurredScrollView(
          maskColor: theme.bgColor,
          padding: const EdgeInsets.symmetric(
                  horizontal: GeneralConst.paddingHorizontal) +
              const EdgeInsets.only(top: GeneralConst.paddingVertical),
          children: [
            Text(
              RulesConst.carcassonneAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.carcassonnePlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).dosGameObjectiveTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S
                  .of(context)
                  .buildRoadsCitiesMonasteriesAndFieldsPlacingMeeplesToEarn,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).preparation,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText:
                    S.of(context).shuffleAllTilesAndPutInAFacedownStack),
            BulletPointText(
                contentText:
                    S.of(context).placeTheStartingTileInTheCenterOfTheTable),
            BulletPointText(
                contentText: S.of(context).eachPlayerTakes7MeeplesOfOneColor),
            BulletPointText(
                contentText: S.of(context).placeOneMeepleOnTheScoreTrack0),
            const SizedBox(height: 15),
            Text(
              S.of(context).gameTurnTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).draw1Tile),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText:
                    S.of(context).placeTheTileSoThatEdgesMatchRoadToRoad),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: S.of(context).optionallyPlaceAMeepleOn),
            BulletPointText(contentText: S.of(context).aCityKnight),
            BulletPointText(contentText: S.of(context).aRoadHighwayman),
            BulletPointText(contentText: S.of(context).aMonasteryMonk),
            BulletPointText(
                contentText:
                    S.of(context).aFieldFarmerStaysUntilTheEndOfTheGame),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletFour,
                contentText: S
                    .of(context)
                    .ifAFeatureIsCompletedScorePointsAndReturnMeeples),
            const SizedBox(height: 15),
            Text(
              S.of(context).completedFeaturesScore,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).road1PointPerTile),
            BulletPointText(
                contentText: S.of(context).city2PointsPerTile2PointsPerPennant),
            BulletPointText(
                contentText:
                    S.of(context).monastery9PointsIfSurroundedBy8Tiles),
            const SizedBox(height: 15),
            Text(
              S.of(context).carcassonneIsAregisteredTrademarkOfHansImGlck,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
