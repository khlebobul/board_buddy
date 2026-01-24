import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/features/games/thousand/models/thousand_models.dart';
import 'package:board_buddy/features/games/thousand/widgets/players_score_widget.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';

class BiddingPhaseWidget extends StatelessWidget {
  final BiddingPhaseState state;

  const BiddingPhaseWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final currentPlayer = state.players[state.currentBidderIndex];

    return Padding(
      padding: const EdgeInsets.all(GeneralConst.paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).biddingPhase,
                    style: theme.display6.copyWith(
                      color: theme.secondaryTextColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      currentPlayer.name.toLowerCase(),
                      style: theme.display6.copyWith(color: theme.textColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).currentBet,
                    style: theme.display6.copyWith(
                      color: theme.secondaryTextColor,
                    ),
                  ),
                  Text(
                    '${state.highestBid ?? 0}',
                    style: theme.display6.copyWith(
                      color: theme.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Players score with bids
          PlayersScoreWidget(
            players: state.players,
            playerData: state.playerData,
            currentPlayerIndex: state.currentBidderIndex,
            passedPlayers: state.passedPlayers,
            showBids: true,
          ),
          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Gaimon.soft();
                    context.read<ThousandBloc>().add(PassBidding());
                  },
                  child: Text(
                    S.of(context).pass,
                    style: theme.display2.copyWith(
                      color: theme.redColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ThousandBiddingKeyboard(
                state: state,
                onBidSelected: (value) {
                  context.read<ThousandBloc>().add(MakeBid(value));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A custom keyboard widget for bidding in the Thousand game.
class _ThousandBiddingKeyboard extends StatelessWidget {
  final BiddingPhaseState state;
  final Function(int) onBidSelected;

  const _ThousandBiddingKeyboard({
    required this.state,
    required this.onBidSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    // Get card bids (not marriages)
    final cardBids =
        BidOption.allBidOptions.where((b) => !b.isMarriage).toList();

    // Get marriage bid value (use 80 as default)
    final marriageBid = BidOption.allBidOptions
        .where((b) => b.isMarriage)
        .firstWhere((b) => b.value == 80);

    final marriageEnabled =
        state.highestBid == null || marriageBid.value > state.highestBid!;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(8.0),
        color: theme.fgColor,
      ),
      child: Column(
        children: [
          // Row 1: 10, J, Q
          SizedBox(
            height: 55,
            child: Row(
              children: [
                _buildTextButton(
                  bidOption: cardBids[0],
                  theme: theme,
                ),
                _buildTextButton(
                  bidOption: cardBids[1],
                  theme: theme,
                ),
                _buildTextButton(
                  bidOption: cardBids[2],
                  theme: theme,
                  isLast: true,
                ),
              ],
            ),
          ),
          // Row 2: K, A, Heart
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: theme.borderColor, width: 1),
              ),
            ),
            height: 55,
            child: Row(
              children: [
                _buildTextButton(
                  bidOption: cardBids[3],
                  theme: theme,
                ),
                _buildTextButton(
                  bidOption: cardBids[4],
                  theme: theme,
                ),
                _buildIconButton(
                  value: marriageBid.value,
                  isEnabled: marriageEnabled,
                  iconBuilder: (onTap) => HeartIcon(
                    animationDuration: const Duration(milliseconds: 450),
                    color: marriageEnabled
                        ? theme.redColor
                        : theme.secondaryTextColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    onTap: marriageEnabled ? onTap : null,
                  ),
                  theme: theme,
                  isLast: true,
                ),
              ],
            ),
          ),
          // Row 3: Diamond, Club, Spade
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: theme.borderColor, width: 1),
              ),
            ),
            height: 55,
            child: Row(
              children: [
                _buildIconButton(
                  value: marriageBid.value,
                  isEnabled: marriageEnabled,
                  iconBuilder: (onTap) => DiamondIcon(
                    animationDuration: const Duration(milliseconds: 450),
                    color: marriageEnabled
                        ? theme.redColor
                        : theme.secondaryTextColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    onTap: marriageEnabled ? onTap : null,
                  ),
                  theme: theme,
                ),
                _buildIconButton(
                  value: marriageBid.value,
                  isEnabled: marriageEnabled,
                  iconBuilder: (onTap) => ClubIcon(
                    animationDuration: const Duration(milliseconds: 450),
                    color: marriageEnabled
                        ? theme.textColor
                        : theme.secondaryTextColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    onTap: marriageEnabled ? onTap : null,
                  ),
                  theme: theme,
                ),
                _buildIconButton(
                  value: marriageBid.value,
                  isEnabled: marriageEnabled,
                  iconBuilder: (onTap) => SpadeIcon(
                    animationDuration: const Duration(milliseconds: 450),
                    color: marriageEnabled
                        ? theme.textColor
                        : theme.secondaryTextColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    onTap: marriageEnabled ? onTap : null,
                  ),
                  theme: theme,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextButton({
    required BidOption bidOption,
    required UIThemes theme,
    bool isLast = false,
  }) {
    final isEnabled =
        state.highestBid == null || bidOption.value > state.highestBid!;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(
                  right: BorderSide(color: theme.borderColor, width: 1),
                ),
        ),
        child: _AnimatedBidTextButton(
          onTap: isEnabled
              ? () {
                  onBidSelected(bidOption.value);
                  Gaimon.soft();
                }
              : null,
          displayText: bidOption.label,
          theme: theme,
          isEnabled: isEnabled,
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required int value,
    required bool isEnabled,
    required Widget Function(VoidCallback onTap) iconBuilder,
    required UIThemes theme,
    bool isLast = false,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(
                  right: BorderSide(color: theme.borderColor, width: 1),
                ),
        ),
        child: Center(
          child: iconBuilder(() {
            onBidSelected(value);
            Gaimon.soft();
          }),
        ),
      ),
    );
  }
}

/// Animated text button with color animation for bidding
class _AnimatedBidTextButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String displayText;
  final UIThemes theme;
  final bool isEnabled;

  const _AnimatedBidTextButton({
    required this.onTap,
    required this.displayText,
    required this.theme,
    required this.isEnabled,
  });

  @override
  State<_AnimatedBidTextButton> createState() => _AnimatedBidTextButtonState();
}

class _AnimatedBidTextButtonState extends State<_AnimatedBidTextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _updateColorAnimation();
  }

  @override
  void didUpdateWidget(_AnimatedBidTextButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isEnabled != widget.isEnabled) {
      _updateColorAnimation();
    }
  }

  void _updateColorAnimation() {
    _colorAnimation = ColorTween(
      begin:
          widget.isEnabled ? widget.theme.textColor : widget.theme.secondaryTextColor,
      end: widget.theme.secondaryTextColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (widget.onTap != null) {
      widget.onTap!();
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Center(
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Text(
              widget.displayText,
              style: widget.theme.display8.copyWith(
                color: _colorAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}
