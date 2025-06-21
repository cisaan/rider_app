import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rider_app/main.dart';

void main() {
  testWidgets('navigates to LoginScreen', (WidgetTester tester) async {
    // Build the app and display the welcome screen
    await tester.pumpWidget(const MyApp());

    // Tap the "Login" button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    // Verify that the LoginScreen is shown
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
