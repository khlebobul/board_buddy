import 'dart:math';
import 'package:board_buddy/config/theme/app_colors.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/catan/models/catan_resource.dart';
import 'package:board_buddy/features/games/catan/models/catan_tile.dart';
import 'package:board_buddy/features/games/catan/widgets/hexagon_border_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:not_static_icons/not_static_icons.dart';

class CatanMapGeneratorDialog extends StatefulWidget {
  const CatanMapGeneratorDialog({super.key});

  @override
  State<CatanMapGeneratorDialog> createState() =>
      _CatanMapGeneratorDialogState();
}

class _CatanMapGeneratorDialogState extends State<CatanMapGeneratorDialog>
    with SingleTickerProviderStateMixin {
  List<CatanTile> tiles = [];
  final random = Random();
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isGenerating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _generateMap();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateMapWithAnimation();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _generateMapWithAnimation() async {
    if (_isGenerating) return;
    _isGenerating = true;

    HapticFeedback.selectionClick();

    await _controller.forward();

    const rollDuration = Duration(milliseconds: 400);
    const interval = Duration(milliseconds: 50);
    final stopwatch = Stopwatch()..start();

    while (stopwatch.elapsed < rollDuration) {
      _generateMap();
      await Future.delayed(interval);
    }

    _generateMap();

    await _controller.reverse();
    _isGenerating = false;
  }

  void _generateMap() {
    final resources = <CatanResource>[
      ...List.filled(4, CatanResource.wood),
      ...List.filled(4, CatanResource.wheat),
      ...List.filled(4, CatanResource.sheep),
      ...List.filled(3, CatanResource.brick),
      ...List.filled(3, CatanResource.ore),
      CatanResource.desert,
    ];

    final numbers = [2, 3, 3, 4, 4, 5, 5, 6, 6, 8, 8, 9, 9, 10, 10, 11, 11, 12];

    resources.shuffle(random);
    numbers.shuffle(random);

    int numberIndex = 0;
    tiles = resources.map((resource) {
      if (resource == CatanResource.desert) {
        return CatanTile(resource: resource, number: null);
      }
      return CatanTile(resource: resource, number: numbers[numberIndex++]);
    }).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Dialog(
      backgroundColor: theme.bgColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: XIcon(
                color: theme.secondaryTextColor,
                strokeWidth: 1.5,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            _buildHexGrid(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHexGrid(UIThemes theme) {
    final rowSizes = [3, 4, 5, 4, 3];
    const hexWidth = 48.0;
    const hexHeight = hexWidth * 1.155;
    const gap = 4.0;
    const verticalSpacing = hexHeight * 0.75 + gap * 0.866;

    int tileIndex = 0;
    List<Widget> rows = [];

    for (int row = 0; row < rowSizes.length; row++) {
      List<Widget> hexesInRow = [];
      for (int col = 0; col < rowSizes[row]; col++) {
        if (tileIndex < tiles.length) {
          hexesInRow.add(
            Padding(
              padding: EdgeInsets.symmetric(horizontal: gap / 2),
              child: _buildHexTile(tiles[tileIndex], hexWidth, theme),
            ),
          );
          tileIndex++;
        }
      }
      rows.add(
        Transform.translate(
          offset: Offset(0, row * (verticalSpacing - hexHeight)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: hexesInRow,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _generateMapWithAnimation,
      child: SizedBox(
        height: 300,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rows,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHexTile(CatanTile tile, double width, UIThemes theme) {
    final isRedNumber = tile.number == 6 || tile.number == 8;
    final height = width * 1.155;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: HexagonBorderPainter(
              fillColor: tile.resource.color,
              borderColor: theme.textColor,
              borderWidth: 1.5,
            ),
          ),
          if (tile.number != null)
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: LightModeColors.background,
                shape: BoxShape.circle,
                border: Border.all(color: LightModeColors.text, width: 1.5),
              ),
              child: Center(
                child: Text(
                  '${tile.number}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isRedNumber ? theme.redColor : LightModeColors.text,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
