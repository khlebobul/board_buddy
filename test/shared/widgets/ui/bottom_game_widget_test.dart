import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:not_static_icons/not_static_icons.dart';

void main() {
  testWidgets('arrow hit area is larger than the icon', (tester) async {
    var undoTaps = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomGameBar(
            isArrow: true,
            onLeftArrowTap: () => undoTaps++,
          ),
        ),
      ),
    );

    final center = tester.getCenter(find.byType(Undo2Icon));
    await tester.tapAt(center + const Offset(18, 0));
    await tester.pump();

    expect(undoTaps, 1);
  });
}
