import 'dart:io';

import 'package:utility/utility.dart';

import 'api_dtos.dart';

const initialUrl = 'https://swapi.dev/api/people/';

class CatalogApiClient {
  final Client _client;

  CatalogApiClient(this._client);

  Future<CharactersDto> getCharacters(String? next) async {
    final url = Uri.parse(next ?? initialUrl);

    try {
      final resp = await _client.get(url);
      if (resp.statusCode == HttpStatus.ok) {
        final characters = CharactersDto.fromRawJson(resp.body);

        for (var character in characters.results) {
          if (character.filmsUrl.isNotEmpty) {
            final films = await Future.wait(
              character.filmsUrl.map(
                (filmUrl) => getFilm(filmUrl),
              ),
            );

            character.films = films;
          }
        }

        return characters;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<FilmDto> getFilm(String url) async {
    try {
      final resp = await _client.get(Uri.parse(url));
      if (resp.statusCode == HttpStatus.ok) {
        return FilmDto.fromRawJson(resp.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
