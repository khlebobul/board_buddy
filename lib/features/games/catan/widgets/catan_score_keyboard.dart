import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';

/// A custom keyboard widget for score adjustments in the Catan game.
class CatanScoreKeyboard extends StatelessWidget {
  /// Callback function when a button is pressed, providing the score change value.
  final Function(int) onValueSelected;

  const CatanScoreKeyboard({
    required this.onValueSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(8.0),
        color: theme.fgColor,
      ),
      child: Column(
        children: [
          // Top row: Settlement, City, VP Card with icons
          SizedBox(
            height: 55,
            child: Row(
              children: [
                _buildIconButton(
                  value: 1,
                  iconBuilder: (onTap) => HouseIcon(
                    animationDuration: Duration(milliseconds: 450),
                    color: theme.textColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    onTap: onTap,
                  ),
                  theme: theme,
                ),
                _buildIconButton(
                  value: 1,
                  iconBuilder: (onTap) => Building2Icon(
                    animationDuration: Duration(milliseconds: 450),
                    color: theme.textColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    onTap: onTap,
                  ),
                  theme: theme,
                ),
                _buildIconButton(
                  value: 1,
                  iconBuilder: (onTap) => VictoryPointsIcon(
                    color: theme.textColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    onTap: onTap,
                  ),
                  theme: theme,
                  isLast: true,
                ),
              ],
            ),
          ),
          // Full width +2 button with icons
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: theme.borderColor, width: 1),
              ),
            ),
            height: 55,
            child: _buildRoadArmyButton(
              value: 2,
              theme: theme,
            ),
          ),
          // Bottom row: -1, -2
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
                  value: -1,
                  displayText: '-1',
                  theme: theme,
                ),
                _buildTextButton(
                  value: -2,
                  displayText: '-2',
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

  Widget _buildIconButton({
    required int value,
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
            onValueSelected(value);
            Gaimon.soft();
          }),
        ),
      ),
    );
  }

  Widget _buildTextButton({
    required int value,
    required String displayText,
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
        child: _AnimatedTextButton(
          onTap: () {
            onValueSelected(value);
            Gaimon.soft();
          },
          displayText: displayText,
          theme: theme,
        ),
      ),
    );
  }

  Widget _buildRoadArmyButton({
    required int value,
    required UIThemes theme,
  }) {
    return _AnimatedRoadArmyButton(
      value: value,
      theme: theme,
      onValueSelected: onValueSelected,
    );
  }
}

/// Animated text button with color animation
class _AnimatedTextButton extends StatefulWidget {
  final VoidCallback onTap;
  final String displayText;
  final UIThemes theme;

  const _AnimatedTextButton({
    required this.onTap,
    required this.displayText,
    required this.theme,
  });

  @override
  State<_AnimatedTextButton> createState() => _AnimatedTextButtonState();
}

class _AnimatedTextButtonState extends State<_AnimatedTextButton>
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
    _colorAnimation = ColorTween(
      begin: widget.theme.textColor,
      end: widget.theme.secondaryTextColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    widget.onTap();
    _controller.forward().then((_) => _controller.reverse());
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
              style: widget.theme.display3.copyWith(
                color: _colorAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Button for road/army with icon animation
class _AnimatedRoadArmyButton extends StatelessWidget {
  final int value;
  final UIThemes theme;
  final Function(int) onValueSelected;

  const _AnimatedRoadArmyButton({
    required this.value,
    required this.theme,
    required this.onValueSelected,
  });

  void _onTap() {
    onValueSelected(value);
    Gaimon.soft();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoadIcon(
            size: 28,
            color: theme.textColor,
            strokeWidth: 1,
            hoverColor: theme.secondaryTextColor,
            onTap: _onTap,
          ),
          const SizedBox(width: 20),
          SlashIcon(
            size: 15,
            color: theme.textColor,
            strokeWidth: 1,
            enableTouchInteraction: false,
          ),
          const SizedBox(width: 20),
          SwordsIcon(
            size: 28,
            color: theme.textColor,
            strokeWidth: 1,
            hoverColor: theme.secondaryTextColor,
            onTap: _onTap,
          )
        ],
      ),
    );
  }
}
