import 'dart:math';
import 'package:board_buddy/config/theme/app_colors.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum CatanResource {
  wood,
  brick,
  wheat,
  sheep,
  ore,
  desert,
}

extension CatanResourceColor on CatanResource {
  Color get color {
    switch (this) {
      case CatanResource.wood:
        return const Color(0xFF5D7A3A);
      case CatanResource.brick:
        return const Color(0xFFA65D32);
      case CatanResource.wheat:
        return const Color(0xFFE8D44D);
      case CatanResource.sheep:
        return const Color(0xFF9DC45F);
      case CatanResource.ore:
        return const Color(0xFF7A7A7A);
      case CatanResource.desert:
        return const Color(0xFFD4C89A);
    }
  }
}

class CatanTile {
  final CatanResource resource;
  final int? number;

  CatanTile({required this.resource, this.number});
}

class CatanMapGeneratorDialog extends StatefulWidget {
  const CatanMapGeneratorDialog({super.key});

  @override
  State<CatanMapGeneratorDialog> createState() =>
      _CatanMapGeneratorDialogState();
}

class _CatanMapGeneratorDialogState extends State<CatanMapGeneratorDialog> {
  List<CatanTile> tiles = [];
  final random = Random();

  @override
  void initState() {
    super.initState();
    _generateMap();
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
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, color: theme.secondaryTextColor),
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
      onTap: _generateMap,
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
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

class HexagonBorderPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  HexagonBorderPainter({
    required this.fillColor,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.75);
    path.lineTo(0, h * 0.25);
    path.close();

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
