import 'package:board_buddy/config/utils/useful_methods.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('emailUri encodes subject with spaces and no dash', () {
    final uri = emailUri('hello@example.com', 'feature request');

    expect(uri.toString(),
        'mailto:hello@example.com?subject=feature%20request%20Board%20Buddy');
    expect(uri.toString(), isNot(contains('+')));
    expect(uri.queryParameters['subject'], isNot(contains('-')));
  });
}
