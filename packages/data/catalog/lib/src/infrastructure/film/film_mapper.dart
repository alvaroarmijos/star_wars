import '../../domain/film/film.dart';
import '../api_dtos.dart';

class FilmMapper {
  const FilmMapper();

  Film fromApiDto(FilmDto dto) {
    final title = dto.title;

    return Film(
      title: title,
    );
  }

  List<Film> fromApiDtoList(List<FilmDto> dtos) =>
      dtos.map((e) => fromApiDto(e)).toList();
}
