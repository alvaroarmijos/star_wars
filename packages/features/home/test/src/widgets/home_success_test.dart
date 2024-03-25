import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/src/widgets/widgets.dart';

void main() {
  testWidgets('should render a Character Item without LinearProgressIndicator',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: HomeSuccess(
            characters: [Character.empty],
            loadingNewData: false,
          ),
        ),
      ),
    );

    expect(find.byType(LinearProgressIndicator), findsNothing);
    expect(find.byType(CharacterItem), findsOneWidget);
  });

  testWidgets('should render a Character Item with LinearProgressIndicator',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: HomeSuccess(
            characters: [Character.empty],
            loadingNewData: true,
          ),
        ),
      ),
    );

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    expect(find.byType(CharacterItem), findsOneWidget);
  });
}
