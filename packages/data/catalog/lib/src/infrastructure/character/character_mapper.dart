import '../../domain/character/character.dart';
import '../api_dtos.dart';

class CharacterMapper {
  const CharacterMapper();

  Character fromApiDto(CharacterDto dto) {
    final name = dto.name!;
    final gender = genderValues.map[dto.gender]!;
    final films = dto.films ?? [];

    return Character(
      name: name,
      gender: gender,
      films: films,
    );
  }

  List<Character> fromApiDtoList(List<CharacterDto> dtos) =>
      dtos.map((e) => fromApiDto(e)).toList();
}
