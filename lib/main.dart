import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:randwish_app/core/theme_provider.dart';
import 'package:randwish_app/core/themes/themes.dart';
import 'package:randwish_app/presentation/home/home.dart';
import 'package:randwish_app/presentation/settings/settings.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // GoRouter configuration
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(
            title: 'Flutter Demo Home Page',
          ),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(
            title: 'Settings Page',
          ),
        ),
      ],
    );

    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: lightThemeData,
            darkTheme: darkThemeData,
            themeMode: themeProvider.themeMode,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
