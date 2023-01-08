import 'package:educational_app/configs/themes/app_dark_theme.dart';
import 'package:educational_app/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:educational_app/configs/themes/app_light_theme.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryLightColorLight, primaryColorLight],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryDarkColorDark, primaryColorDark],
);

LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;
