import 'package:flutter/material.dart';
import 'package:pharmaplay_cpanel/src/utlites/shared_pref.dart';

class PharmaTheme {
  ThemeMode uiThemeMode;
  Color primaryColor;
  Color secondaryColor;
  Color bgColor;
  Color fontbodyColor;
  PharmaTheme({
    required this.uiThemeMode,
    required this.primaryColor,
    required this.secondaryColor,
    required this.bgColor,
    required this.fontbodyColor,
  });

  factory PharmaTheme.createPharmaTheme({required ThemeMode mode}) {
    if (mode == ThemeMode.dark) {
      return PharmaThemeDark();
    } else {
      return PharmaThemeLight();
    }
  }
//-------
  saveToShaerdPref() async {
    await MySharedPreferences.instance
        .setStringValue("ThemeMode", uiThemeMode.name);
    await MySharedPreferences.instance
        .setIntegerValue("primaryColor", primaryColor.value);
    await MySharedPreferences.instance
        .setIntegerValue("secondaryColor", secondaryColor.value);
    await MySharedPreferences.instance
        .setIntegerValue("bgColor", bgColor.value);
    await MySharedPreferences.instance
        .setIntegerValue("fontbodyColor", fontbodyColor.value);
  }

//-------
//=======

  Future<PharmaTheme> loadPharmaTheme() async {
    String savedThemeMode =
        await MySharedPreferences.instance.getStringValue("ThemeMode");
    if (savedThemeMode == '' || savedThemeMode.isEmpty) {
      return PharmaTheme.createPharmaTheme(mode: ThemeMode.light);
    }
    Color primaryColor = Color(
        await MySharedPreferences.instance.getIntegerValue("primaryColor"));
    Color secondaryColor = Color(
        await MySharedPreferences.instance.getIntegerValue("secondaryColor"));
    Color bgColor =
        Color(await MySharedPreferences.instance.getIntegerValue("bgColor"));
    Color fontbodyColor = Color(
        await MySharedPreferences.instance.getIntegerValue("fontbodyColor"));

    return PharmaTheme(
        uiThemeMode:
            savedThemeMode == 'dark' ? ThemeMode.dark : ThemeMode.light,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        bgColor: bgColor,
        fontbodyColor: fontbodyColor);
  }
}

//----------------------

class PharmaThemeDark extends PharmaTheme {
  PharmaThemeDark()
      : super(
            uiThemeMode: ThemeMode.dark,
            primaryColor: const Color(0xFF2697FF),
            secondaryColor: const Color(0xFF2A2D3E),
            bgColor: const Color(0xFF212332),
            fontbodyColor: const Color(0xFF71CAE6));
}

class PharmaThemeLight extends PharmaTheme {
  PharmaThemeLight()
      : super(
            uiThemeMode: ThemeMode.light,
            primaryColor: const Color(0xFF294966),
            secondaryColor: const Color(0xFFA0CFFC),
            bgColor: const Color(0xFFCDE1FF),
            fontbodyColor: const Color(0xFF020D18));
}
