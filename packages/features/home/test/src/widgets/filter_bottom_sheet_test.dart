import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:home/src/widgets/filter_bottom_sheet.dart';
import 'package:utility/utility.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
  });

  testWidgets('should render a BottomSheet', (widgetTester) async {
    when(() => mockHomeBloc.state).thenReturn(
      const HomeState(),
    );

    await widgetTester.pumpWidget(
      BlocProvider<HomeBloc>(
        create: (context) => mockHomeBloc,
        child: const MaterialApp(
          home: Material(
            child: FilterBottomSheet(),
          ),
        ),
      ),
    );

    expect(find.text('Filters'), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byType(RadioListTile<Gender?>),
        findsNWidgets(Gender.values.length));
  });
}
