// ignore_for_file: prefer_final_fields

import 'package:marketplace/src/models/colors/colors_theme_dark_model.dart';

class RpeModel {
  double? _width;
  double? _height;
  String? _email;
  ColorsThemePrincipalModel _colorsThemePrincipalModel =
      ColorsThemePrincipalModel();

  getWidth() {
    return _width;
  }

  getHeight() {
    return _height;
  }

  getEmail() {
    return _email;
  }

  getColorsThemePrincipalModel() {
    return _colorsThemePrincipalModel;
  }

  setWidth(double newWidth) {
    _width = newWidth;
  }

  setHeight(double newHeight) {
    _height = newHeight;
  }

  setEmail(String? newEmail){
    _email = newEmail;
  }
}
