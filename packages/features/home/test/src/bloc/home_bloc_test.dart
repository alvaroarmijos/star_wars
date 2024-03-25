import 'package:catalog/catalog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:utility/utility.dart';

class MockGetCharactersUseCase extends Mock implements GetCharactersUseCase {}

void main() {
  late MockGetCharactersUseCase mockGetCharactersUseCase;

  setUp(() {
    mockGetCharactersUseCase = MockGetCharactersUseCase();
  });

  group('GetCharactersEvent', () {
    blocTest<HomeBloc, HomeState>(
      'emits [ViewStatus.loading, ViewStatus.success] when GetCommitsEvent is added.',
      setUp: () => when(() => mockGetCharactersUseCase(null)).thenAnswer(
        (_) => Stream.value(Characters.empty),
      ),
      build: () => HomeBloc(mockGetCharactersUseCase),
      act: (bloc) => bloc.add(const GetCharactersEvent(null)),
      expect: () => const <HomeState>[
        HomeState(
          status: ViewStatus.loading,
          characters: Characters.empty,
        ),
        HomeState(
          status: ViewStatus.success,
          characters: Characters.empty,
          lastPage: true,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loadingNewData: true, ViewStatus.success] when GetCommitsEvent is added.',
      setUp: () => when(() => mockGetCharactersUseCase(null)).thenAnswer(
        (_) => Stream.value(Characters.empty),
      ),
      seed: () => const HomeState(charactersFiltered: [Character.empty]),
      build: () => HomeBloc(mockGetCharactersUseCase),
      act: (bloc) => bloc.add(const GetCharactersEvent(null)),
      expect: () => const <HomeState>[
        HomeState(
            charactersFiltered: [Character.empty],
            characters: Characters.empty,
            loadingNewData: true),
        HomeState(
            status: ViewStatus.success,
            charactersFiltered: [],
            characters: Characters.empty,
            lastPage: true,
            loadingNewData: false),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeError] when GetCommitsEvent is added.',
      setUp: () =>
          when(() => mockGetCharactersUseCase(null)).thenThrow(Exception()),
      build: () => HomeBloc(mockGetCharactersUseCase),
      act: (bloc) => bloc.add(const GetCharactersEvent(null)),
      errors: () => [
        isA<Exception>(),
      ],
      expect: () => const <HomeState>[
        HomeState(
          status: ViewStatus.loading,
          characters: Characters.empty,
        ),
        HomeState(
          status: ViewStatus.failure,
          characters: Characters.empty,
        ),
      ],
    );
  });

  group('AddFilterEvent', () {
    blocTest<HomeBloc, HomeState>(
      'emits [charactersFiltered, filter] when AddFilterEvent Gender.all is added.',
      build: () => HomeBloc(mockGetCharactersUseCase),
      act: (bloc) => bloc.add(const AddFilterEvent(Gender.all)),
      expect: () => const <HomeState>[
        HomeState(
          filter: Gender.all,
          charactersFiltered: [],
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [charactersFiltered, filter] when AddFilterEvent Gender other is added.',
      build: () => HomeBloc(mockGetCharactersUseCase),
      act: (bloc) => bloc.add(const AddFilterEvent(Gender.male)),
      expect: () => const <HomeState>[
        HomeState(
          filter: Gender.male,
          charactersFiltered: [],
        ),
      ],
    );
  });
}
