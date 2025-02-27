import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/locale_provider.dart';
import 'main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, localeProvider, themeProvider, child) {
          return MaterialApp(
            // Localization delegates to load translations
            localizationsDelegates: const [
              AppLocalizations.delegate, // Generated localization delegate
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: localeProvider.supportedLocales, // List of supported locales
            locale: localeProvider.locale, // Current locale from LocaleProvider

            // Fallback logic if locale is unsupported
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale != null) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode) {
                    return supportedLocale;
                  }
                }
              }
              return supportedLocales.first; // Default to first locale
            },

            title: 'App-Body',

            // Apply selected theme
            theme: ThemeData.light(), // Light theme
            darkTheme: ThemeData.dark(), // Dark theme
            themeMode: themeProvider.themeMode, // Apply the selected theme mode (light, dark, system)

            home: const MainScreen(), // Main screen of the app
          );
        },
      ),
    );
  }
}
