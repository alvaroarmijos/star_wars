import 'package:flutter/material.dart';

import 'app/di/injection_container.dart' as di;
import 'app/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  runApp(const MyApp());
}
