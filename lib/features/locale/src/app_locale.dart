import 'package:app_assets/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocale {
  final BuildContext context;
  AppLocale._(this.context);

  //of
  static AppLocale of(BuildContext context) {
    return AppLocale._(context);
  }

  AppLocalizations get translate => AppLocalizations.of(context)!;
  static LocalizationsDelegate<AppLocalizations> get appLocaleDelegate =>
      AppLocalizations.delegate;
  static LocalizationsDelegate<MaterialLocalizations> get materialDelegate =>
      GlobalMaterialLocalizations.delegate;
  static LocalizationsDelegate<WidgetsLocalizations> get widgetsDelegate =>
      GlobalWidgetsLocalizations.delegate;
  static LocalizationsDelegate<CupertinoLocalizations> get cupertinoDelegate =>
      GlobalCupertinoLocalizations.delegate;

  // get current locale
  Locale get locale => Localizations.localeOf(context);

  static List<Language> get supportedLanguages => [
        Language(
          name: 'English',
          locale: const Locale('en', 'US'),
          flag: AppAssets.englishIcon,
        ),
        Language(
          name: 'German',
          locale: const Locale('de', 'DE'),
          flag: AppAssets.germanyIcon,
        ),
        Language(
          name: 'Polish',
          locale: const Locale('pl', 'PL'),
          flag: AppAssets.polishIcon,
        ),
      ];
}

class Language {
  final String name;
  final Locale locale;
  final String flag;

  Language({required this.name, required this.locale, required this.flag});
}
