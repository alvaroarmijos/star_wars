import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/src/widgets/widgets.dart';

void main() {
  const Character character = Character(
      name: 'name', gender: Gender.male, films: [Film(title: 'title')]);
  testWidgets('should render a Character Item', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: CharacterItem(
            character: character,
          ),
        ),
      ),
    );

    expect(find.text('name'), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
    expect(find.text(Gender.male.name), findsOneWidget);
  });
}
