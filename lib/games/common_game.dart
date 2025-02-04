import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/app_constants.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/widgets/app_widgets/bottom_game_widget.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/game_widgets/dice_modal.dart';
import 'package:board_buddy/widgets/game_widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// common game screen (calculator)
class CommonGame extends StatefulWidget {
  const CommonGame({super.key});

  @override
  CommonGameState createState() => CommonGameState();
}

class CommonGameState extends State<CommonGame> {
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomGameBar(
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
