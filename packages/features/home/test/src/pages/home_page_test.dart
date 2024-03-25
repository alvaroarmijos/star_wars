import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:home/src/widgets/widgets.dart';
import 'package:utility/utility.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
  });

  Widget homePage = BlocProvider<HomeBloc>(
    create: (context) => mockHomeBloc,
    child: const MaterialApp(
      home: HomePage(),
    ),
  );

  group('Home page', () {
    testWidgets('should render success view ', (widgetTester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeState(status: ViewStatus.success),
      );

      await widgetTester.pumpWidget(homePage);

      expect(find.byType(HomeSuccess), findsOneWidget);
    });

    testWidgets('should render loading view ', (widgetTester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeState(status: ViewStatus.loading),
      );

      await widgetTester.pumpWidget(homePage);

      expect(find.byType(HomeLoading), findsOneWidget);
    });

    testWidgets('should render error view ', (widgetTester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeState(status: ViewStatus.failure),
      );

      await widgetTester.pumpWidget(homePage);

      expect(find.byType(HomeLoading), findsOneWidget);
    });
  });
}
