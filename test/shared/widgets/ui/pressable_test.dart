import 'package:board_buddy/shared/widgets/ui/pressable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('scales down while pressed and resets on cancel', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: Pressable(
            onTap: () {},
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      ),
    );

    final center = tester.getCenter(find.byType(SizedBox));

    final gesture = await tester.startGesture(center);
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(milliseconds: 50));

    expect(_scale(), lessThan(1));

    await gesture.cancel();
    await tester.pumpAndSettle();

    expect(_scale(), closeTo(1, 0.001));
  });
}

double _scale() {
  final transform = testerTransform();
  return transform.storage[0];
}

Matrix4 testerTransform() {
  final transform = find
      .byKey(const ValueKey('pressable-transform'))
      .evaluate()
      .single
      .widget as Transform;
  return transform.transform;
}
