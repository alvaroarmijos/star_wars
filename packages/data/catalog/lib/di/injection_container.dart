import 'package:catalog/catalog.dart';
import 'package:catalog/src/infrastructure/film/film_mapper.dart';
import 'package:utility/utility.dart';

import '../src/domain/characters/characters_repository.dart';
import '../src/infrastructure/api_client.dart';
import '../src/infrastructure/character/character_mapper.dart';
import '../src/infrastructure/characters/characters_mapper.dart';
import '../src/infrastructure/characters/characters_repository_impl.dart';

Future<void> configureDependencies(GetIt sl) async {
  //Use cases
  sl.registerLazySingleton(() => GetCharactersUseCase(sl()));

  //Mappers
  sl.registerLazySingleton(() => const FilmMapper());
  sl.registerLazySingleton(() => CharacterMapper(sl()));
  sl.registerLazySingleton(() => CharactersMapper(sl()));

  //Repository
  sl.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(
      sl(),
      sl(),
    ),
  );

  // Api Client
  sl.registerLazySingleton(
    () => CatalogApiClient(sl()),
  );
}
