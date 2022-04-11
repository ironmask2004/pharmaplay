import 'shared_pref.dart';

abstract class localeUI {
  static String currentLocale = '';

  static changelocaleUI() async {
    currentLocale =
        await MySharedPreferences.instance.getStringValue("localeUI");
    currentLocale = currentLocale == 'ar' ? 'en' : 'ar';

    await MySharedPreferences.instance
        .setStringValue("localeUI", currentLocale);
    print(' LAnguge UI Changed to : $currentLocale ');
  }

  static Future<String> getlocaleUI() async {
    currentLocale =
        await MySharedPreferences.instance.getStringValue("localeUI");
    currentLocale = currentLocale == 'ar' ? 'en' : 'ar';

    print(' LAnguge UI     : $currentLocale ');
    return (currentLocale);
  }
}
