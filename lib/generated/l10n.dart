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

  /// `board buddy`
  String get boardBuddy {
    return Intl.message(
      'board buddy',
      name: 'boardBuddy',
      desc: '',
      args: [],
    );
  }

  /// `about`
  String get about {
    return Intl.message(
      'about',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `games`
  String get games {
    return Intl.message(
      'games',
      name: 'games',
      desc: '',
      args: [],
    );
  }

  /// `rules`
  String get rules {
    return Intl.message(
      'rules',
      name: 'rules',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `back`
  String get back {
    return Intl.message(
      'back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `check my website`
  String get checkMyWebsite {
    return Intl.message(
      'check my website',
      name: 'checkMyWebsite',
      desc: '',
      args: [],
    );
  }

  /// `follow me on x (twitter)`
  String get followMeOnXTwitter {
    return Intl.message(
      'follow me on x (twitter)',
      name: 'followMeOnXTwitter',
      desc: '',
      args: [],
    );
  }

  /// `github repository`
  String get githubRepository {
    return Intl.message(
      'github repository',
      name: 'githubRepository',
      desc: '',
      args: [],
    );
  }

  /// `since this is an open-source project, feel free to contribute to it`
  String get sinceThisIsAnOpenSourceProjectYouCanLeave {
    return Intl.message(
      'since this is an open-source project, feel free to contribute to it',
      name: 'sinceThisIsAnOpenSourceProjectYouCanLeave',
      desc: '',
      args: [],
    );
  }

  /// `don't have your favourite game? email me!`
  String get dontHaveYourFavouriteGameEmailMe {
    return Intl.message(
      'don\'t have your favourite game? email me!',
      name: 'dontHaveYourFavouriteGameEmailMe',
      desc: '',
      args: [],
    );
  }

  /// `telegram`
  String get telegram {
    return Intl.message(
      'telegram',
      name: 'telegram',
      desc: '',
      args: [],
    );
  }

  /// `project website`
  String get projectWebsite {
    return Intl.message(
      'project website',
      name: 'projectWebsite',
      desc: '',
      args: [],
    );
  }

  /// `rate the app`
  String get rateTheApp {
    return Intl.message(
      'rate the app',
      name: 'rateTheApp',
      desc: '',
      args: [],
    );
  }

  /// `share with friends`
  String get shareWithFriends {
    return Intl.message(
      'share with friends',
      name: 'shareWithFriends',
      desc: '',
      args: [],
    );
  }

  /// ` lets you track scores and key moments effortlessly, keeping your focus on the game`
  String get letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour {
    return Intl.message(
      ' lets you track scores and key moments effortlessly, keeping your focus on the game',
      name: 'letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour',
      desc: '',
      args: [],
    );
  }

  /// `hey! my name is gleb`
  String get heyMyNameIsGleb {
    return Intl.message(
      'hey! my name is gleb',
      name: 'heyMyNameIsGleb',
      desc: '',
      args: [],
    );
  }

  /// `email copied`
  String get emailCopied {
    return Intl.message(
      'email copied',
      name: 'emailCopied',
      desc: '',
      args: [],
    );
  }

  /// `languages`
  String get languages {
    return Intl.message(
      'languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `report a bug`
  String get reportABug {
    return Intl.message(
      'report a bug',
      name: 'reportABug',
      desc: '',
      args: [],
    );
  }

  /// `share feedback`
  String get shareFeedback {
    return Intl.message(
      'share feedback',
      name: 'shareFeedback',
      desc: '',
      args: [],
    );
  }

  /// `feature request`
  String get featureRequest {
    return Intl.message(
      'feature request',
      name: 'featureRequest',
      desc: '',
      args: [],
    );
  }

  /// `others`
  String get others {
    return Intl.message(
      'others',
      name: 'others',
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
