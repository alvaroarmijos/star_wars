import 'package:catalog/src/domain/characters/characters.dart';

abstract class CharactersRepository {
  Stream<Characters> getAllByPage(String? next);
}
