import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

Future<void> configureDependencies(GetIt sl) async {
  //! External
  sl.registerLazySingleton(() => http.Client());
}
