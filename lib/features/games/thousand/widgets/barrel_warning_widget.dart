import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaimon/gaimon.dart';

class BarrelWarningWidget extends StatelessWidget {
  final BarrelWarningState state;

  const BarrelWarningWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Padding(
      padding: const EdgeInsets.all(GeneralConst.paddingHorizontal),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Text(
                state.playersOnBarrel.length == 1
                    ? S.of(context).playerOnBarrel
                    : S.of(context).playersOnBarrel,
                style: theme.display2.copyWith(
                  color: theme.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 12),
              ...state.playersOnBarrel.map((playerIndex) {
                final player = state.players[playerIndex];
                final score = state.playerData[playerIndex]!.totalScore;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '${player.name.toLowerCase()} - $score',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: theme.display2.copyWith(
                      color: theme.redColor,
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).thousandSpecialRulesTitleOne,
            textAlign: TextAlign.center,
            style: theme.display2.copyWith(
              color: theme.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).currentCount,
                style: theme.display2.copyWith(
                  color: theme.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 12),
              ...state.players.asMap().entries.map((entry) {
                final index = entry.key;
                final player = entry.value;
                final score = state.playerData[index]!.totalScore;
                final isOnBarrel = state.playersOnBarrel.contains(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          player.name.toLowerCase(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: theme.display2.copyWith(
                            color:
                                isOnBarrel ? theme.redColor : theme.textColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$score',
                        style: theme.display2.copyWith(
                          color: isOnBarrel ? theme.redColor : theme.textColor,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
          const Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {
                Gaimon.soft();
                context.read<ThousandBloc>().add(ContinueFromBarrel());
              },
              child: Text(
                S.of(context).continueTitle,
                style: theme.display2.copyWith(
                  color: theme.redColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
