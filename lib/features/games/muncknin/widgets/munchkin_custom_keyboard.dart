import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';

/// A custom keyboard widget for Munchkin one-time modifiers.
class MunchkinCustomKeyboard extends StatefulWidget {
  /// Callback function when a modifier button is pressed, providing the modifier value.
  final Function(int) onModifierSelected;

  /// Callback function when the clear button is pressed.
  final VoidCallback onClear;

  /// Callback function when the gender toggle button is pressed.
  final VoidCallback onGenderToggle;

  /// Callback function when the reset modifiers (bone) button is pressed.
  final VoidCallback onResetModifiers;

  /// Current accumulated modifier value to display
  final int currentModifier;

  /// Whether the current player is male (to show correct gender icon)
  final bool isMale;

  const MunchkinCustomKeyboard({
    required this.onModifierSelected,
    required this.onClear,
    required this.onGenderToggle,
    required this.onResetModifiers,
    this.currentModifier = 0,
    this.isMale = true,
    super.key,
  });

  @override
  State<MunchkinCustomKeyboard> createState() => _MunchkinCustomKeyboardState();
}

class _MunchkinCustomKeyboardState extends State<MunchkinCustomKeyboard> {
  final _trashController = AnimatedIconController();
  final _genderController = AnimatedIconController();
  final _boneController = AnimatedIconController();

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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top row: modifier buttons (+2, +3, +5, +10) and clear
          SizedBox(
            height: 45,
            child: Row(
              children: [
                _buildModifierButton(
                  value: 2,
                  displayText: '+2',
                  theme: theme,
                ),
                _buildModifierButton(
                  value: 3,
                  displayText: '+3',
                  theme: theme,
                ),
                _buildModifierButton(
                  value: 5,
                  displayText: '+5',
                  theme: theme,
                ),
                _buildModifierButton(
                  value: 10,
                  displayText: '+10',
                  theme: theme,
                ),
                _buildClearButton(theme: theme),
              ],
            ),
          ),
          // Bottom row: gender toggle and reset modifiers (bone)
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: theme.borderColor, width: 1),
              ),
            ),
            height: 45,
            child: Row(
              children: [
                _buildGenderButton(theme: theme),
                _buildBoneButton(theme: theme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModifierButton({
    required int value,
    required String displayText,
    required UIThemes theme,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: theme.borderColor, width: 1),
          ),
        ),
        child: _AnimatedTextButton(
          onTap: () {
            widget.onModifierSelected(value);
            Gaimon.soft();
          },
          displayText: displayText,
          theme: theme,
        ),
      ),
    );
  }

  Widget _buildClearButton({
    required UIThemes theme,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _trashController.animate();
          widget.onClear();
          Gaimon.soft();
        },
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: TrashIcon(
            color: theme.textColor,
            size: 24,
            strokeWidth: 1,
            hoverColor: theme.secondaryTextColor,
            interactive: false,
            controller: _trashController,
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton({
    required UIThemes theme,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _genderController.animate();
          widget.onGenderToggle();
          Gaimon.soft();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: theme.borderColor, width: 1),
            ),
          ),
          height: double.infinity,
          alignment: Alignment.center,
          child: widget.isMale
              ? MarsIcon(
                  color: theme.textColor,
                  size: 24,
                  strokeWidth: 1,
                  hoverColor: theme.secondaryTextColor,
                  interactive: false,
                  controller: _genderController,
                )
              : VenusIcon(
                  color: theme.textColor,
                  size: 24,
                  strokeWidth: 1,
                  hoverColor: theme.secondaryTextColor,
                  interactive: false,
                  controller: _genderController,
                ),
        ),
      ),
    );
  }

  Widget _buildBoneButton({
    required UIThemes theme,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _boneController.animate();
          widget.onResetModifiers();
          Gaimon.soft();
        },
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: BoneIcon(
            color: theme.textColor,
            size: 24,
            strokeWidth: 1,
            hoverColor: theme.secondaryTextColor,
            interactive: false,
            controller: _boneController,
          ),
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
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
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
