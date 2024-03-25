import 'dart:io';

import 'package:catalog/src/infrastructure/api_client.dart';
import 'package:catalog/src/infrastructure/api_dtos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility/utility.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late CatalogApiClient apiClient;

  const filmUrl = 'https://swapi.dev/api/films/2/';

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiClient = CatalogApiClient(mockHttpClient);
  });

  setUpAll(() {
    registerFallbackValue(Uri.parse(initialUrl));
    registerFallbackValue(Uri.parse(filmUrl));
  });

  group('Fecth films', () {
    test('should return valid response when the response code is ok', () async {
      final response = readJson('helpers/dummy_data/dummy_films_response.json');

      when(
        () => mockHttpClient.get(any()),
      ).thenAnswer(
        (_) async => Response(response, HttpStatus.ok),
      );

      final result = await apiClient.getFilm(filmUrl);

      expect(result, isA<FilmDto>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () {
      when(
        () => mockHttpClient.get(any()),
      ).thenAnswer(
        (_) async => Response('Not found', HttpStatus.notFound),
      );

      expect(() => apiClient.getFilm(filmUrl), throwsA(isA<Exception>()));
    });
  });

  group('Fecth characters', () {
    test('should return valid response when the response code is ok', () async {
      final response =
          readJson('helpers/dummy_data/dummy_characters_response.json');

      final filmResponse =
          readJson('helpers/dummy_data/dummy_films_response.json');

      when(
        () => mockHttpClient.get(Uri.parse(initialUrl)),
      ).thenAnswer(
        (_) async => Response(response, HttpStatus.ok),
      );

      when(
        () => mockHttpClient.get(Uri.parse(filmUrl)),
      ).thenAnswer(
        (_) async => Response(filmResponse, HttpStatus.ok),
      );

      final result = await apiClient.getCharacters(null);

      expect(result, isA<CharactersDto>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () {
      when(
        () => mockHttpClient.get(any()),
      ).thenAnswer(
        (_) async => Response('Not found', HttpStatus.notFound),
      );

      expect(() => apiClient.getCharacters(null), throwsA(isA<Exception>()));
    });
  });
}
