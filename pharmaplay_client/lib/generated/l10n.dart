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

class SLang {
  SLang();

  static SLang? _current;

  static SLang get current {
    assert(_current != null,
        'No instance of SLang was loaded. Try to initialize the SLang delegate before accessing SLang.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SLang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SLang();
      SLang._current = instance;

      return instance;
    });
  }

  static SLang of(BuildContext context) {
    final instance = SLang.maybeOf(context);
    assert(instance != null,
        'No instance of SLang present in the widget tree. Did you add SLang.delegate in localizationsDelegates?');
    return instance!;
  }

  static SLang? maybeOf(BuildContext context) {
    return Localizations.of<SLang>(context, SLang);
  }

  /// `Some localized strings:`
  String get pageHomeListTitle {
    return Intl.message(
      'Some localized strings:',
      name: 'pageHomeListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {name}`
  String pageHomeSamplePlaceholder(Object name) {
    return Intl.message(
      'Welcome $name',
      name: 'pageHomeSamplePlaceholder',
      desc: '',
      args: [name],
    );
  }

  /// `My name is {lastName}, {firstName} {lastName}`
  String pageHomeSamplePlaceholdersOrdered(Object firstName, Object lastName) {
    return Intl.message(
      'My name is $lastName, $firstName $lastName',
      name: 'pageHomeSamplePlaceholdersOrdered',
      desc: '',
      args: [firstName, lastName],
    );
  }

  /// `{howMany, plural, one{You have 1 message} other{You have {howMany} messages}}`
  String pageHomeSamplePlural(int howMany) {
    return Intl.plural(
      howMany,
      one: 'You have 1 message',
      other: 'You have $howMany messages',
      name: 'pageHomeSamplePlural',
      desc: '',
      args: [howMany],
    );
  }

  /// `Total: {total}`
  String pageHomeSampleTotalAmount(double total) {
    final NumberFormat totalNumberFormat = NumberFormat.currency(
        locale: Intl.getCurrentLocale(), symbol: '€', decimalDigits: 2);
    final String totalString = totalNumberFormat.format(total);

    return Intl.message(
      'Total: $totalString',
      name: 'pageHomeSampleTotalAmount',
      desc: '',
      args: [totalString],
    );
  }

  /// `Date: {date} Time: {time}`
  String pageHomeSampleCurrentDateTime(DateTime date, DateTime time) {
    final DateFormat dateDateFormat = DateFormat.yMd(Intl.getCurrentLocale());
    final String dateString = dateDateFormat.format(date);

    final DateFormat timeDateFormat = DateFormat.Hm(Intl.getCurrentLocale());
    final String timeString = timeDateFormat.format(time);

    return Intl.message(
      'Date: $dateString Time: $timeString',
      name: 'pageHomeSampleCurrentDateTime',
      desc: '',
      args: [dateString, timeString],
    );
  }

  /// `Pharmaplay Market`
  String get appTitle {
    return Intl.message(
      'Pharmaplay Market',
      name: 'appTitle',
      desc: 'The title of the application',
      args: [],
    );
  }

  /// `Confirm-Code`
  String get confirmCode {
    return Intl.message(
      'Confirm-Code',
      name: 'confirmCode',
      desc: '',
      args: [],
    );
  }

  /// `Wellcome Login To PahrmaPlay`
  String get loginPage {
    return Intl.message(
      'Wellcome Login To PahrmaPlay',
      name: 'loginPage',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `signIn`
  String get signIn {
    return Intl.message(
      'signIn',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `forgotPassword`
  String get forgotPassword {
    return Intl.message(
      'forgotPassword',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `signUp`
  String get signUp {
    return Intl.message(
      'signUp',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `_onSignUpLastnameChanged`
  String get onsignuplastnamechanged {
    return Intl.message(
      '_onSignUpLastnameChanged',
      name: 'onsignuplastnamechanged',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailaddress {
    return Intl.message(
      'Email',
      name: 'emailaddress',
      desc: '',
      args: [],
    );
  }

  /// `_onforgotEmailChanged`
  String get onforgotemailchanged {
    return Intl.message(
      '_onforgotEmailChanged',
      name: 'onforgotemailchanged',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Back To `
  String get backTo {
    return Intl.message(
      'Back To ',
      name: 'backTo',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get SetLanguage {
    return Intl.message(
      'Change Language',
      name: 'SetLanguage',
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

  /// `Apply New Settings`
  String get applyNewSettings {
    return Intl.message(
      'Apply New Settings',
      name: 'applyNewSettings',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `English Language`
  String get englishLanguage {
    return Intl.message(
      'English Language',
      name: 'englishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `اللغة العربية`
  String get SignInchangeLanguage {
    return Intl.message(
      'اللغة العربية',
      name: 'SignInchangeLanguage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SLang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SLang> load(Locale locale) => SLang.load(locale);
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
