import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/language_selector.dart';
import 'widgets/theme_selector.dart';

/// The `SettingsScreen` allows the user to change the app's language, theme,
/// adjust the walking distance radius, and set the distance unit.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.nav_settings ?? 'Settings'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Language selector widget
            LanguageSelector(),
            SizedBox(height: 16.0),
            // Theme selector widget
            ThemeSelector(),
          ],
        ),
      ),
    );
  }
}
