import 'package:flutter/material.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';
import 'package:qrdeer_app/router.dart';
import 'package:qrdeer_app/theme.dart';

final ValueNotifier<Locale> appLocale = ValueNotifier(const Locale('fr'));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: appLocale,
      builder: (context, locale, child) {
        return MaterialApp.router(
          title: 'QRDeer App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: appRouter,
        );
      },
    );
  }
}
