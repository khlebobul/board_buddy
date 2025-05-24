import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:flutter/material.dart';

class TicketToRideRulesScreen extends StatelessWidget {
  const TicketToRideRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).ticketToRide,
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
              RulesConst.ticketToRideAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.ticketToRidePlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).gameGoal,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S
                  .of(context)
                  .scoreTheMostPointsByClaimingTrainRoutesAndCompleting,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).preparation,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText:
                    S.of(context).eachPlayerChoosesAColorAndTakes45TrainCars),
            BulletPointText(
                contentText:
                    S.of(context).shuffleAndDeal4TrainCarCardsToEachPlayer),
            BulletPointText(
                contentText: S
                    .of(context)
                    .shuffleDestinationTicketsAndDeal3ToEachPlayerKeep),
            BulletPointText(
                contentText: S
                    .of(context)
                    .placeTheRemainingDestinationAndTrainCarCardsAsSeparate),
            BulletPointText(
                contentText: S.of(context).reveal5TrainCarCardsFaceUp),
            const SizedBox(height: 15),
            Text(
              S.of(context).gameTurnTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).drawTrainCarCards2TotalOneAtATime),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText:
                    S.of(context).claimARouteByDiscardingMatchingCards),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: S.of(context).draw3DestinationTicketsKeepAtLeast1),
            const SizedBox(height: 15),
            Text(
              S.of(context).routeRules,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText:
                    S.of(context).routesRequireANumberOfCardsOfASpecificColor),
            BulletPointText(
                contentText:
                    S.of(context).grayRoutesCanBeClaimedWithAnyColorButAll),
            BulletPointText(
                contentText:
                    S.of(context).doubleRoutesIn45PlayerGamesAllowTwoPlayersTo),
            const SizedBox(height: 15),
            Text(
              S.of(context).locomotiveCard,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText:
                    S.of(context).locomotivesActAsWildCardsAndCanReplaceAnyColor),
            BulletPointText(
                contentText:
                    S.of(context).ifYouDrawAFaceupLocomotiveItMustBeThe),
            const SizedBox(height: 15),
            Text(
              S.of(context).endGameTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText:
                    S.of(context).whenAPlayerHas2OrFewerTrainCarsLeft),
            const SizedBox(height: 15),
            Text(
              S.of(context).scrabbleScoringTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText:
                    S.of(context).pointsForEachRouteClaimedLongerRoutesGiveMorePoints),
            BulletPointText(
                contentText:
                    S.of(context).addsubtractPointsFromCompletedfailedDestinationTickets),
            BulletPointText(
                contentText:
                    S.of(context).tenBonusPointsForTheLongestContinuousPath),
            const SizedBox(height: 15),
            Text(
              S.of(context).victoryTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).playerWithTheMostPointsWins),
            BulletPointText(
                contentText:
                    S.of(context).inCaseOfATiePlayerWithTheMostCompleted),
            const SizedBox(height: 20),
            Text(
              S.of(context).ticketToRideIsARegisteredTrademarkOfDaysOf,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
