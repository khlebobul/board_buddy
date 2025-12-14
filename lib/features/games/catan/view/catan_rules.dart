import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:flutter/material.dart';

class CatanRulesScreen extends StatelessWidget {
  const CatanRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Scaffold(
      backgroundColor: theme.bgColor,
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: 'catan',
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
              RulesConst.catanAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.catanPlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              'game goal',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              'be the first player to reach 10 victory points by building settlements, cities, roads, and earning special cards.',
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              'components',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(
                contentText:
                    '19 terrain hexes (4 forest, 4 grain, 4 pasture, 3 mountains, 3 hills, 1 desert)'),
            const BulletPointText(contentText: '6 sea frame pieces'),
            const BulletPointText(contentText: '9 harbor pieces'),
            const BulletPointText(contentText: '18 number tokens'),
            const BulletPointText(
                contentText:
                    '95 resource cards (19 each: lumber, brick, wool, grain, ore)'),
            const BulletPointText(contentText: '25 development cards'),
            const BulletPointText(
                contentText:
                    'player pieces: 5 settlements, 4 cities, 15 roads per player'),
            const BulletPointText(
                contentText: '2 special cards: longest road, largest army'),
            const BulletPointText(contentText: '1 robber, 2 dice'),
            const SizedBox(height: 15),
            Text(
              'setup',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText:
                    'assemble the board with terrain hexes inside the sea frame'),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: 'place number tokens on hexes (except desert)'),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: 'place the robber on the desert hex'),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletFour,
                contentText:
                    'each player places 2 settlements and 2 roads in reverse turn order'),
            const SizedBox(height: 15),
            Text(
              'resources',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(contentText: 'forest → lumber (wood)'),
            const BulletPointText(contentText: 'hills → brick (clay)'),
            const BulletPointText(contentText: 'pasture → wool (sheep)'),
            const BulletPointText(contentText: 'fields → grain (wheat)'),
            const BulletPointText(contentText: 'mountains → ore'),
            const BulletPointText(contentText: 'desert → no resources'),
            const SizedBox(height: 15),
            Text(
              'turn structure',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText:
                    'roll dice: all players with settlements/cities on hexes matching the number receive resources'),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText:
                    'trade: exchange resources with other players or use harbors (4:1 or special rates)'),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText:
                    'build: spend resources to construct roads, settlements, cities, or buy development cards'),
            const SizedBox(height: 15),
            Text(
              'building costs',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(contentText: 'road: 1 lumber + 1 brick'),
            const BulletPointText(
                contentText:
                    'settlement: 1 lumber + 1 brick + 1 wool + 1 grain (1 vp)'),
            const BulletPointText(
                contentText: 'city (upgrade): 2 grain + 3 ore (2 vp)'),
            const BulletPointText(
                contentText: 'development card: 1 wool + 1 grain + 1 ore'),
            const SizedBox(height: 15),
            Text(
              'development cards',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(
                contentText:
                    'knight (14): move robber, steal 1 resource from adjacent player'),
            const BulletPointText(
                contentText:
                    'victory point (5): worth 1 vp, keep hidden until winning'),
            const BulletPointText(
                contentText: 'road building (2): build 2 roads for free'),
            const BulletPointText(
                contentText:
                    'year of plenty (2): take any 2 resources from bank'),
            const BulletPointText(
                contentText:
                    'monopoly (2): name a resource, all players give you theirs'),
            const SizedBox(height: 15),
            Text(
              'the robber (rolling 7)',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText:
                    'any player with more than 7 cards must discard half (rounded down)'),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: 'move the robber to any hex (except desert)'),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText:
                    'steal 1 random resource from a player with a settlement/city on that hex'),
            const BulletPointText(
                pointSimbol: BulletPointsConst.bulletFour,
                contentText:
                    'the blocked hex produces no resources while robber is there'),
            const SizedBox(height: 15),
            Text(
              'special cards (2 vp each)',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(
                contentText:
                    'longest road: first player with 5+ continuous roads (can be stolen)'),
            const BulletPointText(
                contentText:
                    'largest army: first player with 3+ played knight cards (can be stolen)'),
            const SizedBox(height: 15),
            Text(
              'building rules',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(
                contentText:
                    'roads must connect to your existing roads, settlements, or cities'),
            const BulletPointText(
                contentText:
                    'settlements must be at least 2 intersections away from any other settlement/city'),
            const BulletPointText(
                contentText: 'settlements must connect to your road network'),
            const BulletPointText(
                contentText: 'cities replace existing settlements'),
            const SizedBox(height: 15),
            Text(
              'trading',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(
                contentText:
                    'domestic trade: negotiate any exchange with other players on your turn'),
            const BulletPointText(
                contentText:
                    'maritime trade: 4:1 with bank (any 4 same resources for 1)'),
            const BulletPointText(
                contentText:
                    'harbor trade: 3:1 generic or 2:1 specific resource harbors'),
            const SizedBox(height: 15),
            Text(
              'victory points',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            const BulletPointText(contentText: 'settlement: 1 vp'),
            const BulletPointText(contentText: 'city: 2 vp'),
            const BulletPointText(contentText: 'longest road: 2 vp'),
            const BulletPointText(contentText: 'largest army: 2 vp'),
            const BulletPointText(
                contentText: 'victory point cards: 1 vp each'),
            const SizedBox(height: 15),
            Text(
              'winning',
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              'the first player to reach 10 victory points on their turn wins the game. you must announce your victory on your turn.',
              style: theme.display2,
            ),
            const SizedBox(height: 20),
            Text(
              'catan® is a trademark of catan gmbh. this app is not affiliated with or endorsed by catan gmbh.',
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
