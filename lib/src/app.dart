import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:star_wars/di/injection_container.dart';
import 'package:utility/utility.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(),
      // themeMode: settingsController.themeMode,
      home: BlocProvider(
        create: (context) => sl<HomeBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
