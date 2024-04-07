import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:star_wars/app/di/injection_container.dart';
import 'package:ui/ui.dart';
import 'package:utility/utility.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: MaterialApp(
        // Providing a restorationScopeId allows the Navigator built by the
        // MaterialApp to restore the navigation stack when a user leaves and
        // returns to the app after it has been killed while running in the
        // background.
        restorationScopeId: 'app',

        // Define a light and dark color theme. Then, read the user's
        // preferred ThemeMode (light, dark, or system default) from the
        // SettingsController to display the correct theme.
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            title: ReactiveGyroscope(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                height: 60,
              ),
            ),
          ),
          body: const HomePage(),
        ),
      ),
    );
  }
}
