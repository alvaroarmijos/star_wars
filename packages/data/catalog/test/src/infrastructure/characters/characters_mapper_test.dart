import 'package:catalog/src/domain/characters/characters.dart';
import 'package:catalog/src/infrastructure/api_dtos.dart';
import 'package:catalog/src/infrastructure/character/character_mapper.dart';
import 'package:catalog/src/infrastructure/characters/characters_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility/utility.dart';

class MockCharacterMapper extends Mock implements CharacterMapper {}

void main() {
  late final CharactersMapper mapper;
  late final MockCharacterMapper mockCharacterMapper;
  final charactersDto = CharactersDto(
    count: 0,
    results: [],
  );

  setUpAll(() {
    mockCharacterMapper = MockCharacterMapper();
    mapper = CharactersMapper(mockCharacterMapper);
  });

  group('fromApiDto', () {
    test('should get a Characters from dto', () {
      when(
        () => mockCharacterMapper.fromApiDtoList(any()),
      ).thenReturn([]);

      final character = mapper.fromApiDto(charactersDto);

      expect(character, Characters.empty);
    });
  });
}
