import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDealerWidget extends StatelessWidget {
  final SelectingFirstDealerState state;
  const SelectDealerWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
                horizontal: GeneralConst.paddingHorizontal,
              ) +
              const EdgeInsets.only(top: GeneralConst.paddingVertical),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).whoGoesFirst,
                  style: theme.display2.copyWith(
                    color: theme.secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.players.asMap().entries.map((entry) {
                    int index = entry.key;
                    final player = entry.value;
                    String formattedIndex =
                        (index + 1).toString().padLeft(2, '0');
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThousandBloc>().add(
                                  SelectFirstDealer(index),
                                );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '$formattedIndex - ${player.name}'
                                      .toLowerCase(),
                                  softWrap: true,
                                  style: theme.display2.copyWith(
                                    color: theme.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index < state.players.length - 1)
                          const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
