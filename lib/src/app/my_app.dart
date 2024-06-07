import 'package:admin_panel/src/routing/app_routing.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _lightTheme = LightAppThemeData();

  static final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Panel Admin',
      theme: _lightTheme.materialThemeData,
      darkTheme: _darkTheme.materialThemeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('fa'),
      supportedLocales: const [
        Locale('en'), // English
        Locale('fa'), // Persian
      ],
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}