import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/src/widgets/widgets.dart';

void main() {
  testWidgets('should render a CircularProgressIndicator',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeLoading(),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
