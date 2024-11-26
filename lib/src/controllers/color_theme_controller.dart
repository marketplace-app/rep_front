import 'package:marketplace/src/models/colors/colors_theme_dark_model.dart';
import 'package:flutter/material.dart';

class ColorThemeController extends ChangeNotifier {
  static ColorsThemePrincipalModel colorTheme = ColorsThemePrincipalModel();

  ColorThemeController();

  ColorsThemePrincipalModel getColorTheme() {
    return colorTheme;
  }
}
