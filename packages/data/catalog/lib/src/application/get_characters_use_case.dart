import '../domain/characters/characters.dart';
import '../domain/characters/characters_repository.dart';

class GetCharactersUseCase {
  const GetCharactersUseCase(
    this._charactersRepository,
  );

  final CharactersRepository _charactersRepository;

  Stream<Characters> call(String? next) =>
      _charactersRepository.getAllByPage(next);
}
