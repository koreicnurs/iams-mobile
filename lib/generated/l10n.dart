// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `112 Kyrgyzstan`
  String get kyrgyzstan_header {
    return Intl.message(
      '112 Kyrgyzstan',
      name: 'kyrgyzstan_header',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get language {
    return Intl.message(
      'English',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get main {
    return Intl.message(
      'Main',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Report an emergency`
  String get emergency {
    return Intl.message(
      'Report an emergency',
      name: 'emergency',
      desc: '',
      args: [],
    );
  }

  /// `Urgent notifications`
  String get notification {
    return Intl.message(
      'Urgent notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `COVID-19 map`
  String get map_covid {
    return Intl.message(
      'COVID-19 map',
      name: 'map_covid',
      desc: '',
      args: [],
    );
  }

  /// `Map of storm warnings`
  String get map_storm {
    return Intl.message(
      'Map of storm warnings',
      name: 'map_storm',
      desc: '',
      args: [],
    );
  }

  /// `First aid instruction`
  String get first_aid {
    return Intl.message(
      'First aid instruction',
      name: 'first_aid',
      desc: '',
      args: [],
    );
  }

  /// `Rules of conduct in emergency situations`
  String get emergency_rules {
    return Intl.message(
      'Rules of conduct in emergency situations',
      name: 'emergency_rules',
      desc: '',
      args: [],
    );
  }

  /// `Radiation security`
  String get radiation {
    return Intl.message(
      'Radiation security',
      name: 'radiation',
      desc: '',
      args: [],
    );
  }

  /// `About application`
  String get about {
    return Intl.message(
      'About application',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
