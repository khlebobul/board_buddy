import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/dice_modal.dart';
import 'package:board_buddy/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 12) +
              const EdgeInsets.only(top: 12),
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
    );
  }
}
