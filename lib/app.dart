
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:optimal_oncology/ui/screens/splash_screen.dart';
import 'blocs/app_themes.dart';
import 'blocs/initial_settings/initial_bloc.dart';

import 'blocs/theme_settings/theme_bloc.dart';
import 'blocs/theme_settings/theme_state.dart';
import 'utils/app_localization.dart';
import 'blocs/language/language_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider(create: (context) => LoginBloc(RealUserRepo())),
          BlocProvider(create: (context) => LanguageBloc()..add(LanguageLoadStarted())),
          BlocProvider(
              create: (context) => ThemeBloc(
                  ThemeState(themeData: appThemeData[AppTheme.dark])))
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: _buildWithLanguage,

        ));
  }
}

Widget _buildWithLanguage(BuildContext context, LanguageState languageState) {
  return BlocBuilder<ThemeBloc, ThemeState>(
    builder: (context, themeState) => MaterialApp(
      locale: languageState.lcoale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,

      ],
      supportedLocales: [
        Locale('en', 'US'),
      ],
      theme: themeState.themeData,
      debugShowCheckedModeBanner: false,
      home: Container(
        child: BlocProvider(
          create: (context) => InitialBloc(),
          child: SplashScreen(),
        ),
      ),
    ),
  );
}
