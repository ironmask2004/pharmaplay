import 'shared_pref.dart';

abstract class UILocale {
  static String currentLocale = '';

  static changeUILocale() async {
    currentLocale =
        await MySharedPreferences.instance.getStringValue("UILocale");
    currentLocale = currentLocale == 'ar' ? 'en' : 'ar';

    await MySharedPreferences.instance
        .setStringValue("UILocale", currentLocale);
    print(' LAnguge UI Changed to : $currentLocale ');
  }

  static Future<String> getUILocale() async {
    currentLocale =
        await MySharedPreferences.instance.getStringValue("UILocale");
    currentLocale = currentLocale == 'ar' ? 'en' : 'ar';

    print(' LAnguge UI     : $currentLocale ');
    return (currentLocale);
  }
}
