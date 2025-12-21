import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaimon/gaimon.dart';

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
          // Top row: Settlement, City, VP Card with SVG icons
          SizedBox(
            height: 55,
            child: Row(
              children: [
                _buildSvgButton(
                  value: 1,
                  svgPath: CustomIcons.home,
                  theme: theme,
                ),
                _buildSvgButton(
                  value: 1,
                  svgPath: CustomIcons.city,
                  theme: theme,
                ),
                _buildSvgButton(
                  value: 1,
                  svgPath: CustomIcons.vp,
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

  Widget _buildSvgButton({
    required int value,
    required String svgPath,
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
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            onValueSelected(value);
            Gaimon.soft();
          },
          child: Center(
            child: SvgPicture.asset(
              svgPath,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
            ),
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
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            onValueSelected(value);
            Gaimon.soft();
          },
          child: Center(
            child: Text(
              displayText,
              style: theme.display3.copyWith(color: theme.textColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoadArmyButton({
    required int value,
    required UIThemes theme,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onValueSelected(value);
        Gaimon.soft();
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              CustomIcons.road,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '/',
                style: theme.display3.copyWith(color: theme.textColor),
              ),
            ),
            SvgPicture.asset(
              CustomIcons.army,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
