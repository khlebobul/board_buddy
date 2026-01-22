import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/useful_methods.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';

/// widget that represents a score widget for multiple players.
class PlayersScoreWidget extends StatelessWidget {
  /// List of players whose scores are displayed.
  final List<Player> players;

  /// Callback function to increase the score of a player.
  final void Function(int index) onIncrease;

  /// Callback function to decrease the score of a player.
  final void Function(int index) onDecrease;

  const PlayersScoreWidget({
    required this.players,
    required this.onIncrease,
    required this.onDecrease,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    if (players.length == 1) {
      return _SinglePlayerScoreWidget(
        player: players[0],
        onIncrease: () => onIncrease(0),
        onDecrease: () => onDecrease(0),
      );
    }

    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(20),
        color: theme.fgColor,
      ),
      child: Column(
        children: [
          for (int index = 0; index < players.length; index++) ...[
            _MultiPlayerScoreRow(
              player: players[index],
              index: index,
              onIncrease: () => onIncrease(index),
              onDecrease: () => onDecrease(index),
            ),
            if (index < players.length - 1)
              Divider(
                color: theme.borderColor,
                height: 1,
              ),
          ],
        ],
      ),
    );
  }
}

/// Single player score widget with animation
class _SinglePlayerScoreWidget extends StatefulWidget {
  final Player player;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _SinglePlayerScoreWidget({
    required this.player,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  State<_SinglePlayerScoreWidget> createState() =>
      _SinglePlayerScoreWidgetState();
}

class _SinglePlayerScoreWidgetState extends State<_SinglePlayerScoreWidget> {
  final GlobalKey<_AnimatedIconButtonState> _minusKey = GlobalKey();
  final GlobalKey<_AnimatedIconButtonState> _plusKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(20),
        color: theme.fgColor,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _AnimatedIconButton(
                    key: _minusKey,
                    icon: MinusIcon(
                      color: theme.redColor,
                      size: 24,
                      strokeWidth: 1.5,
                      hoverColor: theme.secondaryTextColor,
                    ),
                    onTap: () {
                      widget.onDecrease();
                      Gaimon.soft();
                    },
                  ),
                  Text(
                    widget.player.score.toString(),
                    style: theme.display2.copyWith(
                      color: widget.player.score < 0
                          ? theme.redColor
                          : theme.textColor,
                    ),
                  ),
                  _AnimatedIconButton(
                    key: _plusKey,
                    icon: PlusIcon(
                      color: theme.redColor,
                      size: 24,
                      strokeWidth: 1.5,
                      hoverColor: theme.secondaryTextColor,
                    ),
                    onTap: () {
                      widget.onIncrease();
                      Gaimon.soft();
                    },
                  ),
                ],
              ),
            ),
            // Left half for decrease
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: constraints.maxWidth / 2,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _minusKey.currentState?.triggerAnimation();
                  widget.onDecrease();
                  Gaimon.soft();
                },
                child: const SizedBox.shrink(),
              ),
            ),
            // Right half for increase
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: constraints.maxWidth / 2,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _plusKey.currentState?.triggerAnimation();
                  widget.onIncrease();
                  Gaimon.soft();
                },
                child: const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Multi-player score row with animation
class _MultiPlayerScoreRow extends StatefulWidget {
  final Player player;
  final int index;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _MultiPlayerScoreRow({
    required this.player,
    required this.index,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  State<_MultiPlayerScoreRow> createState() => _MultiPlayerScoreRowState();
}

class _MultiPlayerScoreRowState extends State<_MultiPlayerScoreRow> {
  final GlobalKey<_AnimatedIconButtonState> _minusKey = GlobalKey();
  final GlobalKey<_AnimatedIconButtonState> _plusKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _AnimatedIconButton(
                  key: _minusKey,
                  icon: MinusIcon(
                    color: theme.redColor,
                    size: 24,
                    strokeWidth: 1.5,
                    hoverColor: theme.secondaryTextColor,
                  ),
                  onTap: () {
                    widget.onDecrease();
                    Gaimon.soft();
                  },
                ),
                Column(
                  children: [
                    Text(
                      '${formatPlayerNumber(widget.index + 1)} - ${widget.player.name.toLowerCase()}',
                      style: theme.display2.copyWith(
                        color: theme.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.player.score.toString(),
                      style: theme.display2.copyWith(
                        color: widget.player.score < 0
                            ? theme.redColor
                            : theme.textColor,
                      ),
                    ),
                  ],
                ),
                _AnimatedIconButton(
                  key: _plusKey,
                  icon: PlusIcon(
                    color: theme.redColor,
                    size: 24,
                    strokeWidth: 1.5,
                    hoverColor: theme.secondaryTextColor,
                  ),
                  onTap: () {
                    widget.onIncrease();
                    Gaimon.soft();
                  },
                ),
              ],
            ),
          ),
          // Left half for decrease
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: constraints.maxWidth / 2,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _minusKey.currentState?.triggerAnimation();
                widget.onDecrease();
                Gaimon.soft();
              },
              child: const SizedBox.shrink(),
            ),
          ),
          // Right half for increase
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: constraints.maxWidth / 2,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _plusKey.currentState?.triggerAnimation();
                widget.onIncrease();
                Gaimon.soft();
              },
              child: const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Animated icon button wrapper that triggers icon animation
class _AnimatedIconButton extends StatefulWidget {
  final Widget icon;
  final VoidCallback onTap;

  const _AnimatedIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<_AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void triggerAnimation() {
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: widget.icon,
        );
      },
    );
  }
}
