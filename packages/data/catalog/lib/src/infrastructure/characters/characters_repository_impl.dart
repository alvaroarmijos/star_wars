import '../../domain/characters/characters.dart';
import '../../domain/characters/characters_repository.dart';
import '../api_client.dart';
import 'characters_mapper.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CatalogApiClient _apiClient;
  final CharactersMapper _charactersMapper;

  CharactersRepositoryImpl(
    this._apiClient,
    this._charactersMapper,
  );

  @override
  Stream<Characters> getAllByPage(String? next) =>
      _apiClient.getCharacters(next).asStream().map(
            (dto) => _charactersMapper.fromApiDto(dto),
          );
}
