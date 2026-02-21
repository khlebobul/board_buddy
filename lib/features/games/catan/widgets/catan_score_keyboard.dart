import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/catan/bloc/catan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';

/// A custom keyboard widget for score adjustments in the Catan game.
class CatanScoreKeyboard extends StatefulWidget {
  /// Callback function when a button is pressed, providing the score change value.
  final Function(int) onValueSelected;

  /// Callback function when a badge is claimed.
  final Function(CatanBadgeType) onBadgeClaimed;

  const CatanScoreKeyboard({
    required this.onValueSelected,
    required this.onBadgeClaimed,
    super.key,
  });

  @override
  State<CatanScoreKeyboard> createState() => _CatanScoreKeyboardState();
}

class _CatanScoreKeyboardState extends State<CatanScoreKeyboard> {
  final _houseController = AnimatedIconController();
  final _buildingController = AnimatedIconController();
  final _vpController = AnimatedIconController();
  final _roadController = AnimatedIconController();
  final _swordsController = AnimatedIconController();

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
                    interactive: false,
                    controller: _houseController,
                  ),
                  controller: _houseController,
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
                    interactive: false,
                    controller: _buildingController,
                  ),
                  controller: _buildingController,
                  theme: theme,
                ),
                _buildIconButton(
                  value: 1,
                  icon: VictoryPointsIcon(
                    color: theme.textColor,
                    size: 28,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    interactive: false,
                    controller: _vpController,
                  ),
                  controller: _vpController,
                  theme: theme,
                  isLast: true,
                ),
              ],
            ),
          ),
          // Badge buttons row: Longest Road and Largest Army
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: theme.borderColor, width: 1),
              ),
            ),
            height: 55,
            child: Row(
              children: [
                _buildBadgeButton(
                  badgeType: CatanBadgeType.longestRoad,
                  icon: RoadIcon(
                    size: 28,
                    color: theme.textColor,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    interactive: false,
                    controller: _roadController,
                  ),
                  controller: _roadController,
                  theme: theme,
                ),
                _buildBadgeButton(
                  badgeType: CatanBadgeType.largestArmy,
                  icon: SwordsIcon(
                    size: 28,
                    color: theme.textColor,
                    strokeWidth: 1,
                    hoverColor: theme.secondaryTextColor,
                    interactive: false,
                    controller: _swordsController,
                  ),
                  controller: _swordsController,
                  theme: theme,
                  isLast: true,
                ),
              ],
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
    required AnimatedIconController controller,
    required UIThemes theme,
    bool isLast = false,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.animate();
          widget.onValueSelected(value);
          Gaimon.soft();
        },
        child: Container(
          decoration: BoxDecoration(
            border: isLast
                ? null
                : Border(
                    right: BorderSide(color: theme.borderColor, width: 1),
                  ),
          ),
          child: Center(
            child: icon,
          ),
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
            widget.onValueSelected(value);
            Gaimon.soft();
          },
          displayText: displayText,
          theme: theme,
        ),
      ),
    );
  }

  Widget _buildBadgeButton({
    required CatanBadgeType badgeType,
    required Widget icon,
    required AnimatedIconController controller,
    required UIThemes theme,
    bool isLast = false,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.animate();
          widget.onBadgeClaimed(badgeType);
          Gaimon.soft();
        },
        child: Container(
          decoration: BoxDecoration(
            border: isLast
                ? null
                : Border(
                    right: BorderSide(color: theme.borderColor, width: 1),
                  ),
          ),
          child: Center(child: icon),
        ),
      ),
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
