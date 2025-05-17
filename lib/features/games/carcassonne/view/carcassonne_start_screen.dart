import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/games/carcassonne/bloc/carcassonne_bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_scramble/use_scramble.dart';

class CarcassonneStartScreen extends StatelessWidget {
  const CarcassonneStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CarcassonneBloc()..add(InitializeCarcassonneStartScreen()),
      child: const CarcassonneStartScreenView(),
    );
  }
}

class CarcassonneStartScreenView extends StatelessWidget {
  const CarcassonneStartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarcassonneBloc, CarcassonneState>(
      builder: (context, state) {
        if (state is! CarcassonneStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final carcassonneState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: S.of(context).carcassonne,
              onRightButtonPressed: () {},
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                        horizontal: GeneralConst.paddingHorizontal) +
                    const EdgeInsets.only(top: GeneralConst.paddingVertical),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).mode,
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                      _buildModeOption(context, S.of(context).manual, carcassonneState),
                      _buildModeOption(context, S.of(context).automatic, carcassonneState),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomGameBar(
              rightButtonText: S.of(context).play,
              isRightBtnRed: true,
              leftButtonText: S.of(context).rules,
              onLeftBtnTap: () =>
                  Navigator.pushNamed(context, '/carcassonneRules'),
              onRightBtnTap: () {
                Navigator.pushNamed(
                  context,
                  '/carcassonneGame',
                  arguments: {
                    'isAutomatic': carcassonneState.isAutomatic,
                  },
                );
              },
            ),
            resizeToAvoidBottomInset: true,
          ),
        );
      },
    );
  }

  Widget _buildModeOption(BuildContext context, String modeName,
      CarcassonneStartScreenState state) {
    final theme = UIThemes.of(context);

    return GestureDetector(
      onTap: () {
        context.read<CarcassonneBloc>().add(SelectGameMode(modeName));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: state.selectedMode == modeName
                ? theme.redColor
                : Colors.transparent,
            radius: 3,
          ),
          const SizedBox(width: 8),
          TextScramble(
            text: modeName,
            style: theme.display2,
          ),
        ],
      ),
    );
  }
}
