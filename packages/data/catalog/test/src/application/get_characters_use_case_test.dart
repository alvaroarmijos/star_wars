import 'package:catalog/catalog.dart';
import 'package:catalog/src/domain/characters/characters_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility/utility.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  late GetCharactersUseCase useCase;
  late MockCharactersRepository mockCharactersRepository;

  setUp(() {
    mockCharactersRepository = MockCharactersRepository();
    useCase = GetCharactersUseCase(mockCharactersRepository);
  });

  test('should get characters', () async {
    when(
      () => mockCharactersRepository.getAllByPage(any()),
    ).thenAnswer(
      (_) => Stream.value(Characters.empty),
    );

    final result = await useCase(null).first;

    expect(result, isA<Characters>());
    verify(() => mockCharactersRepository.getAllByPage(null)).called(1);
    verifyNoMoreInteractions(mockCharactersRepository);
  });
}
