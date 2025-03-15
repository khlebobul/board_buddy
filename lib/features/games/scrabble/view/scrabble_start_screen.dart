import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/games/scrabble/bloc/scrabble_bloc.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_scramble/use_scramble.dart';

class ScrabbleStartScreen extends StatelessWidget {
  const ScrabbleStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScrabbleBloc()..add(InitializeScrabbleStartScreen()),
      child: const ScrabbleStartScreenView(),
    );
  }
}

class ScrabbleStartScreenView extends StatelessWidget {
  const ScrabbleStartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrabbleBloc, ScrabbleState>(
      builder: (context, state) {
        if (state is! ScrabbleStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final scrabbleState = state;
        final theme = UIThemes.of(context);

        return Scaffold(
          appBar: CustomAppBar(
            leftButtonText: S.of(context).back,
            onLeftButtonPressed: () => Navigator.pop(context),
            rightButtonText: S.of(context).scrabble,
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
                    // players list
                    Text(
                      S.of(context).players,
                      style: theme.display2
                          .copyWith(color: theme.secondaryTextColor),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          scrabbleState.players.asMap().entries.map((entry) {
                        int index = entry.key + 1;
                        Player player = entry.value;
                        String formattedIndex =
                            index.toString().padLeft(2, '0');
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '$formattedIndex - ${player.name}'
                                    .toLowerCase(),
                                softWrap: true,
                                style: theme.display2
                                    .copyWith(color: theme.textColor),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close,
                                  color: theme.secondaryTextColor),
                              onPressed: () {
                                context
                                    .read<ScrabbleBloc>()
                                    .add(RemovePlayer(entry.key));
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    if (scrabbleState.players.length < GameMaxPlayers.scrabble)
                      GestureDetector(
                        onTap: () {
                          final scrabbleBloc = context.read<ScrabbleBloc>();
                          showDialog(
                            context: context,
                            builder: (dialogContext) => AddPlayerDialog(
                              onPlayerAdded: (player) {
                                scrabbleBloc.add(AddPlayer(player));
                              },
                            ),
                          );
                        },
                        child: TextScramble(
                          text: S.of(context).add,
                          style: theme.display2.copyWith(color: theme.redColor),
                        ),
                      ),

                    // bottom padding for keyboard
                    SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom > 0
                            ? 300
                            : 0),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomGameBar(
              leftButtonText: S.of(context).rules,
              rightButtonText: S.of(context).play,
              isRightBtnRed: true,
              onLeftBtnTap: () =>
                  Navigator.pushNamed(context, '/scrabbleRules'),
              onRightBtnTap: () {
                scrabbleState.players.length < GameMinPlayers.scrabble
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.scrabblePlayers}'),
                        ),
                      )
                    : Navigator.pushNamed(
                        context,
                        '/scrabbleGame',
                        arguments: {
                          'players': scrabbleState.players,
                        },
                      );
              }),
          resizeToAvoidBottomInset: true,
        );
      },
    );
  }
}
