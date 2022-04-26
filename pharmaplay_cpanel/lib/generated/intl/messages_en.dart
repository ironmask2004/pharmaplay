// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(date, time) => "Date: ${date} Time: ${time}";

  static String m1(name) => "Welcome ${name}";

  static String m2(firstName, lastName) =>
      "My name is ${lastName}, ${firstName} ${lastName}";

  static String m3(howMany) =>
      "${Intl.plural(howMany, one: 'You have 1 message', other: 'You have ${howMany} messages')}";

  static String m4(total) => "Total: ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "SetLanguage": MessageLookupByLibrary.simpleMessage("Change Language"),
        "SignInchangeLanguage":
            MessageLookupByLibrary.simpleMessage("اللغة العربية"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Pharmaplay Market"),
        "applyNewSettings":
            MessageLookupByLibrary.simpleMessage("Apply New Settings"),
        "areYouSureYouWantToExit": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to exit?"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "backTo": MessageLookupByLibrary.simpleMessage("Back To "),
        "confirmCode": MessageLookupByLibrary.simpleMessage("Confirm-Code"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "drugGroups": MessageLookupByLibrary.simpleMessage("Drug Groups"),
        "drugRecord": MessageLookupByLibrary.simpleMessage("Drug Card"),
        "drugs": MessageLookupByLibrary.simpleMessage("Drugs"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailaddress": MessageLookupByLibrary.simpleMessage("Email"),
        "englishLanguage":
            MessageLookupByLibrary.simpleMessage("English Language"),
        "exitapp": MessageLookupByLibrary.simpleMessage("Close Pharam Play"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("forgotPassword"),
        "homelogout": MessageLookupByLibrary.simpleMessage("LogOut"),
        "info": MessageLookupByLibrary.simpleMessage("Info"),
        "lightMode": MessageLookupByLibrary.simpleMessage("Light Mode"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading...."),
        "loginPage": MessageLookupByLibrary.simpleMessage(
            "Wellcome Login To PahrmaPlay"),
        "mony": MessageLookupByLibrary.simpleMessage("S.P"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "onforgotemailchanged":
            MessageLookupByLibrary.simpleMessage("_onforgotEmailChanged"),
        "onsignuplastnamechanged":
            MessageLookupByLibrary.simpleMessage("_onSignUpLastnameChanged"),
        "pageHomeListTitle":
            MessageLookupByLibrary.simpleMessage("Some localized strings:"),
        "pageHomeSampleCurrentDateTime": m0,
        "pageHomeSamplePlaceholder": m1,
        "pageHomeSamplePlaceholdersOrdered": m2,
        "pageHomeSamplePlural": m3,
        "pageHomeSampleTotalAmount": m4,
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "pickimage": MessageLookupByLibrary.simpleMessage("Pick Image"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("signIn"),
        "signOut": MessageLookupByLibrary.simpleMessage("signOut"),
        "signUp": MessageLookupByLibrary.simpleMessage("signUp"),
        "themeMode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
        "warning": MessageLookupByLibrary.simpleMessage("Warning"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
