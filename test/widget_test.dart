// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:coupons/main.dart';

void main() {
  testWidgets('Coupons page renders and responds to interactions',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SpacezApp());

    expect(find.text('Coupons'), findsOneWidget);
    expect(find.text('LONGSTAY'), findsOneWidget);
    expect(find.text('Reserve'), findsOneWidget);

    await tester.tap(find.text('Apply').first);
    await tester.pump(const Duration(milliseconds: 200));

    expect(
      find.text('LONGSTAY coupon applied successfully!'),
      findsOneWidget,
    );
  });
}
