import 'package:catalog/catalog.dart' as catalog;
import 'package:utility/utility.dart' as utility;

final sl = utility.GetIt.instance;

Future<void> configureDependencies() async {
  await utility.configureDependencies(sl);
  await catalog.configureDependencies(sl);
}
