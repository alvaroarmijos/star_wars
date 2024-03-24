import 'package:flutter/material.dart';

import 'di/injection_container.dart' as di;
import 'src/app.dart';

void main() async {
  await di.configureDependencies();
  runApp(const MyApp());
}
