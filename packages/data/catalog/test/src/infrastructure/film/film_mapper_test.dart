import 'package:catalog/src/domain/film/film.dart';
import 'package:catalog/src/infrastructure/api_dtos.dart';
import 'package:catalog/src/infrastructure/film/film_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final FilmMapper mapper;
  final filmDto = FilmDto();

  setUpAll(() {
    mapper = const FilmMapper();
  });

  group('fromApiDto', () {
    test('should get a Film from dto', () {
      final commit = mapper.fromApiDto(filmDto);

      expect(commit, Film.empty);
    });
  });
}
