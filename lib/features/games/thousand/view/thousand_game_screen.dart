import 'package:board_buddy/config/routes/routes.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/features/games/thousand/widgets/bidding_phase_widget.dart';
import 'package:board_buddy/features/games/thousand/widgets/scoring_phase_widget.dart';
import 'package:board_buddy/features/games/thousand/widgets/select_dealer_widget.dart';
import 'package:board_buddy/features/games/thousand/widgets/barrel_warning_widget.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThousandGameScreen extends StatelessWidget {
  const ThousandGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomAppBar(
          leftButtonText: S.of(context).menu,
          onLeftButtonPressed: () => Navigator.pushNamed(context, '/home'),
          isRules: true,
          rightButtonText: S.of(context).rules,
          onRightButtonPressed: () =>
              Navigator.pushNamed(context, AppRoutes.thousandRules),
        ),
        body: SafeArea(
          child: BlocBuilder<ThousandBloc, ThousandState>(
            builder: (context, state) {
              if (state is SelectingFirstDealerState) {
                return SelectDealerWidget(state: state);
              } else if (state is BiddingPhaseState) {
                return BiddingPhaseWidget(state: state);
              } else if (state is ScoringPhaseState) {
                return ScoringPhaseWidget(state: state);
              } else if (state is BarrelWarningState) {
                return BarrelWarningWidget(state: state);
              }
              return Center(
                child: CircularProgressIndicator(
                  color: theme.redColor,
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<ThousandBloc, ThousandState>(
          builder: (context, state) {
            if (state is SelectingFirstDealerState ||
                state is BiddingPhaseState ||
                state is ScoringPhaseState ||
                state is BarrelWarningState) {
              return BottomGameBar(
                isArrow: false,
                rightButtonText: S.of(context).options,
                onRightBtnTap: () {
                  _showExitConfirmation(context);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showExitConfirmation(BuildContext context) {
    final theme = UIThemes.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.bgColor,
        title: Text(
          'are you sure?',
          style: theme.display2.copyWith(color: theme.textColor),
        ),
        content: Text(
          'game will be lost',
          style: theme.display3.copyWith(color: theme.secondaryTextColor),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              S.of(context).cancel,
              style: theme.display3.copyWith(color: theme.secondaryTextColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              Navigator.of(context).pop();
            },
            child: Text(
              'exit',
              style: theme.display3.copyWith(color: theme.redColor),
            ),
          ),
        ],
      ),
    );
  }
}