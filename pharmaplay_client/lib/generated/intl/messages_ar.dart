// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(date, time) => "Date: ${date} Time: ${time}";

  static String m1(name) => "اهلا ${name}";

  static String m2(firstName, lastName) =>
      "اسمي هو  ${lastName}, ${firstName} ${lastName}";

  static String m3(howMany) =>
      "${Intl.plural(howMany, one: 'You have 1 message', other: 'You have ${howMany} messages')}";

  static String m4(total) => "Total: ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "SetLanguage": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
        "SignInchangeLanguage":
            MessageLookupByLibrary.simpleMessage("English Language"),
        "appTitle": MessageLookupByLibrary.simpleMessage("الصيدلية"),
        "applyNewSettings":
            MessageLookupByLibrary.simpleMessage("تطبيق الاعدادات الجديدة"),
        "areYouSureYouWantToExit": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من الخروج النهائي؟"),
        "back": MessageLookupByLibrary.simpleMessage("عودة"),
        "backTo": MessageLookupByLibrary.simpleMessage("عودة إلى "),
        "confirmCode": MessageLookupByLibrary.simpleMessage("رمز التحقق"),
        "darkMode": MessageLookupByLibrary.simpleMessage("نمط ألوان غامق"),
        "drugGroups": MessageLookupByLibrary.simpleMessage("أصناف اﻷدوية"),
        "email": MessageLookupByLibrary.simpleMessage("الإيميل"),
        "emailaddress": MessageLookupByLibrary.simpleMessage("Email"),
        "englishLanguage":
            MessageLookupByLibrary.simpleMessage("اللغة اﻷنكليزية"),
        "exitapp":
            MessageLookupByLibrary.simpleMessage("إغلاق برنامج الصيدلية"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة السر"),
        "homelogout": MessageLookupByLibrary.simpleMessage("تسجيل خروج"),
        "lightMode": MessageLookupByLibrary.simpleMessage("نمط ألوان فاتح"),
        "loginPage":
            MessageLookupByLibrary.simpleMessage("تسجيل الدخول إلى الصيدلية"),
        "no": MessageLookupByLibrary.simpleMessage("لا"),
        "onforgotemailchanged":
            MessageLookupByLibrary.simpleMessage("تغيير في البريد الاكتروني"),
        "onsignuplastnamechanged":
            MessageLookupByLibrary.simpleMessage("_onSignUpLastnameChanged"),
        "pageHomeListTitle":
            MessageLookupByLibrary.simpleMessage("بعض النصوص المعربة:"),
        "pageHomeSampleCurrentDateTime": m0,
        "pageHomeSamplePlaceholder": m1,
        "pageHomeSamplePlaceholdersOrdered": m2,
        "pageHomeSamplePlural": m3,
        "pageHomeSampleTotalAmount": m4,
        "password": MessageLookupByLibrary.simpleMessage("كلمة السر"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("اعادة تعيين كلمة السر"),
        "search": MessageLookupByLibrary.simpleMessage("بحث"),
        "settings": MessageLookupByLibrary.simpleMessage("اﻷعدادات!"),
        "signIn": MessageLookupByLibrary.simpleMessage("تسجيل دخول"),
        "signOut": MessageLookupByLibrary.simpleMessage("تسجيل خروج"),
        "signUp": MessageLookupByLibrary.simpleMessage("تسجيل جديد"),
        "themeMode": MessageLookupByLibrary.simpleMessage("نمط اﻷلوان"),
        "warning": MessageLookupByLibrary.simpleMessage("تحذير"),
        "yes": MessageLookupByLibrary.simpleMessage("نعم")
      };
}
