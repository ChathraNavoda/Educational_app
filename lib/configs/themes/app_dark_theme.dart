import 'package:educational_app/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color primaryDarkColorDark = Color.fromARGB(255, 1, 8, 26);
const Color primaryColorDark = Color.fromARGB(255, 71, 86, 129);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
            bodyColor: mainTextColorDark, displayColor: mainTextColorDark));
  }
}
