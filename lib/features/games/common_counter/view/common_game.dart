import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/features/games/common_counter/bloc/common_counter_bloc.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/game_widgets/dice_modal.dart';
import 'package:board_buddy/shared/widgets/game_widgets/timer.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// common game screen (calculator)
class CommonGame extends StatelessWidget {
  final List<Player> players;
  final bool isSinglePlayer;

  const CommonGame({
    required this.players,
    required this.isSinglePlayer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommonCounterBloc()
        ..add(InitializeGameScreen(
          players: players,
          isSinglePlayer: isSinglePlayer,
        )),
      child: const CommonGameView(),
    );
  }
}

class CommonGameView extends StatelessWidget {
  const CommonGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommonCounterBloc, CommonCounterState>(
      builder: (context, state) {
        if (state is! CommonCounterGameState) {
          return const Center(child: CircularProgressIndicator());
        }

        final gameState = state;
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
                      IconButton(
                        icon: Icon(Icons.refresh, color: theme.textColor),
                        onPressed: () {
                          context.read<CommonCounterBloc>().add(ResetScores());
                        },
                      ),
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
                    players: gameState.players,
                    onIncrease: (index) {
                      context
                          .read<CommonCounterBloc>()
                          .add(IncreaseScore(index));
                    },
                    onDecrease: (index) {
                      context
                          .read<CommonCounterBloc>()
                          .add(DecreaseScore(index));
                    },
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
      },
    );
  }
}
