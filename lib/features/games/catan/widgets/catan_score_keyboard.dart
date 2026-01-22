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
                  icon: HouseIcon(
                    animationDuration: Duration(milliseconds: 450),
                    color: theme.textColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                  ),
                  theme: theme,
                ),
                _buildIconButton(
                  value: 1,
                  icon: Building2Icon(
                    animationDuration: Duration(milliseconds: 450),
                    color: theme.textColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                  ),
                  theme: theme,
                ),
                _buildIconButton(
                  value: 1,
                  icon: VictoryPointsIcon(
                    color: theme.textColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
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
    required Widget icon,
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
        child: _AnimatedButton(
          onTap: () {
            onValueSelected(value);
            Gaimon.soft();
          },
          child: icon,
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
        child: _AnimatedButton(
          onTap: () {
            onValueSelected(value);
            Gaimon.soft();
          },
          child: Text(
            displayText,
            style: theme.display3.copyWith(color: theme.textColor),
          ),
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

/// Generic animated button wrapper
class _AnimatedButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const _AnimatedButton({
    required this.onTap,
    required this.child,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton>
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

  void _onTap() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}

/// Animated button for road/army with icon animation
class _AnimatedRoadArmyButton extends StatefulWidget {
  final int value;
  final UIThemes theme;
  final Function(int) onValueSelected;

  const _AnimatedRoadArmyButton({
    required this.value,
    required this.theme,
    required this.onValueSelected,
  });

  @override
  State<_AnimatedRoadArmyButton> createState() =>
      _AnimatedRoadArmyButtonState();
}

class _AnimatedRoadArmyButtonState extends State<_AnimatedRoadArmyButton>
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

  void _onTap() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onValueSelected(widget.value);
    Gaimon.soft();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoadIcon(
                    size: 28,
                    color: widget.theme.textColor,
                    strokeWidth: 1,
                    enableTouchInteraction: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '/',
                      style: widget.theme.display3
                          .copyWith(color: widget.theme.textColor),
                    ),
                  ),
                  SwordsIcon(
                    size: 28,
                    color: widget.theme.textColor,
                    strokeWidth: 1,
                    enableTouchInteraction: false,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
