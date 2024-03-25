import 'package:catalog/catalog.dart';
import 'package:catalog/src/infrastructure/api_dtos.dart';
import 'package:catalog/src/infrastructure/character/character_mapper.dart';
import 'package:catalog/src/infrastructure/film/film_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility/utility.dart';

class MockFilmMapper extends Mock implements FilmMapper {}

void main() {
  late final CharacterMapper mapper;
  late final MockFilmMapper mockFilmMapper;
  final characterDto = CharacterDto(
    name: '',
    gender: 'none',
  );

  setUpAll(() {
    mockFilmMapper = MockFilmMapper();
    mapper = CharacterMapper(mockFilmMapper);
  });

  group('fromApiDto', () {
    test('should get a Character from dto', () {
      when(
        () => mockFilmMapper.fromApiDtoList(any()),
      ).thenReturn([]);

      final character = mapper.fromApiDto(characterDto);

      expect(character, Character.empty);
    });
  });
}
