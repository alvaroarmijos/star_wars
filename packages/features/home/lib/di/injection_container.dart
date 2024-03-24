import 'package:home/src/bloc/home_bloc.dart';
import 'package:utility/utility.dart';

Future<void> configureDependencies(GetIt sl) async {
  //Bloc
  sl.registerFactory(() => HomeBloc(sl()));
}
