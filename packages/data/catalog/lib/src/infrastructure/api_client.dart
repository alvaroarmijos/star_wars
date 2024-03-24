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
        return CharactersDto.fromRawJson(resp.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
