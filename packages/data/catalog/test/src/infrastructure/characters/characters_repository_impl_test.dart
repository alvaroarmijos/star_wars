import 'package:catalog/catalog.dart';
import 'package:catalog/src/domain/characters/characters.dart';
import 'package:catalog/src/infrastructure/api_client.dart';
import 'package:catalog/src/infrastructure/api_dtos.dart';
import 'package:catalog/src/infrastructure/characters/characters_mapper.dart';
import 'package:catalog/src/infrastructure/characters/characters_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility/utility.dart';

class MockCatalogApiClient extends Mock implements CatalogApiClient {}

class MockCharactersMapper extends Mock implements CharactersMapper {}

void main() {
  late MockCatalogApiClient mockCatalogApiClient;
  late MockCharactersMapper mockCharactersMapper;
  late CharactersRepositoryImpl charactersRepositoryImpl;

  final charactersDto = CharactersDto(count: 0, results: []);

  setUp(() {
    mockCatalogApiClient = MockCatalogApiClient();
    mockCharactersMapper = MockCharactersMapper();
    charactersRepositoryImpl = CharactersRepositoryImpl(
      mockCatalogApiClient,
      mockCharactersMapper,
    );
  });

  setUpAll(() {
    registerFallbackValue(charactersDto);
  });

  test('should return Characters when a call to api client is successful',
      () async {
    when(
      () => mockCatalogApiClient.getCharacters(any()),
    ).thenAnswer(
      (_) => Future.value(charactersDto),
    );

    when(
      () => mockCharactersMapper.fromApiDto(any()),
    ).thenReturn(Characters.empty);

    final result = await charactersRepositoryImpl.getAllByPage(null).first;

    expect(result, Characters.empty);
  });

  test(
      'should return a Server Exception when a call to Api Client is unsuccessful',
      () async {
    when(
      () => mockCatalogApiClient.getCharacters(any()),
    ).thenThrow(
      Exception(),
    );

    expect(
      () => charactersRepositoryImpl.getAllByPage(null),
      throwsA(isA<Exception>()),
    );
  });
}
