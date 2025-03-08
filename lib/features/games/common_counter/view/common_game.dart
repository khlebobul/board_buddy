import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/game_widgets/dice_modal.dart';
import 'package:board_buddy/shared/widgets/game_widgets/timer.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// common game screen (calculator)
class CommonGame extends StatefulWidget {
  final List<Player> players;
  final bool isSinglePlayer;

  const CommonGame({
    required this.players,
    required this.isSinglePlayer,
    super.key,
  });

  @override
  CommonGameState createState() => CommonGameState();
}

class CommonGameState extends State<CommonGame> {
  late List<Player> _players;

  @override
  void initState() {
    super.initState();
    _players = List.from(widget.players);
  }

  void _increaseScore(int index) {
    setState(() {
      _players[index].score += 1;
    });
  }

  void _decreaseScore(int index) {
    setState(() {
      if (_players[index].score > 0) {
        _players[index].score -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).common,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
                  horizontal: GeneralConst.paddingHorizontal) +
              const EdgeInsets.only(top: GeneralConst.paddingVertical),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TimerWidget(),
                  const Spacer(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => DiceModal.show(context),
                    child: SvgPicture.asset(
                      CustomIcons.dice,
                      width: 27,
                      height: 27,
                      // ignore: deprecated_member_use
                      color: theme.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PlayersScoreWidget(
                players: _players,
                onIncrease: _increaseScore,
                onDecrease: _decreaseScore,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomGameBar(
        isArrow: true,
        rightButtonText: S.of(context).finish,
        onRightBtnTap: () => Navigator.pop(context),
      ),
    );
  }
}
