import '../../domain/characters/characters.dart';
import '../api_dtos.dart';
import '../character/character_mapper.dart';

class CharactersMapper {
  final CharacterMapper _charactersMapper;

  CharactersMapper(this._charactersMapper);

  Characters fromApiDto(CharactersDto dto) {
    final count = dto.count;
    final next = dto.next;

    final results = _charactersMapper.fromApiDtoList(dto.results);

    return Characters(
      count: count,
      next: next,
      results: results,
    );
  }

  List<Characters> fromApiDtoList(List<CharactersDto> dtos) =>
      dtos.map((e) => fromApiDto(e)).toList();
}
