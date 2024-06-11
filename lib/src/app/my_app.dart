import 'package:admin_panel/src/app/locale_provider.dart';
import 'package:admin_panel/src/routing/app_routing.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../shared/resources/theme/bloc/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _lightTheme = LightAppThemeData();

  static final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> LocaleProvider(),
      child: BlocProvider(

        create: (BuildContext context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (BuildContext context, state) {
            final provider =context.watch<LocaleProvider>();
            return MaterialApp.router(
              title: 'Panel Admin',
              theme: _lightTheme.materialThemeData,
              darkTheme: _darkTheme.materialThemeData,
              themeMode: context.watch<ThemeCubit>().isDark? ThemeMode.dark : ThemeMode.light,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: provider.locale,
              supportedLocales: const [
                Locale('en'), // English
                Locale('fa'), // Persian
              ],
              routerConfig: Routes.routes,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}