import '../../domain/character/character.dart';
import '../api_dtos.dart';
import '../film/film_mapper.dart';

class CharacterMapper {
  const CharacterMapper(
    this._filmMapper,
  );

  final FilmMapper _filmMapper;

  Character fromApiDto(CharacterDto dto) {
    final name = dto.name!;
    final gender = genderValues.map[dto.gender]!;
    final films = _filmMapper.fromApiDtoList(dto.films);

    return Character(
      name: name,
      gender: gender,
      films: films,
    );
  }

  List<Character> fromApiDtoList(List<CharacterDto> dtos) =>
      dtos.map((e) => fromApiDto(e)).toList();
}
