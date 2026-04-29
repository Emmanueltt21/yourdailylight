import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MaterialApp renders a title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('Your Daily Light'),
        ),
      ),
    );

    expect(find.text('Your Daily Light'), findsOneWidget);
  });
}
