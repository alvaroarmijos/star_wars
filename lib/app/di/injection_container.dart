import 'package:catalog/catalog.dart' as catalog;
import 'package:home/home.dart' as home;
import 'package:utility/utility.dart' as utility;

final sl = utility.GetIt.instance;

Future<void> configureDependencies() async {
  await utility.configureDependencies(sl);
  await catalog.configureDependencies(sl);
  await home.configureDependencies(sl);
}
