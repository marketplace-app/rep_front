
// ignore_for_file: prefer_final_fields

import 'package:marketplace/src/models/colors/colors_theme_dark_model.dart';

class RpnModel {
  double? _width;
  double? _height;
  String? _email;
  String? _newPassword;
  String? _replyPassword;
  ColorsThemePrincipalModel _colorsThemePrincipalModel =
      ColorsThemePrincipalModel();

  RpnModel();

  getWidth() {
    return _width;
  }

  getHeight() {
    return _height;
  }

  getEmail() {
    return _email;
  }

  getNewPassword(){
    return _newPassword;
  }

  getReplyPassword(){
    return _replyPassword;
  }

  getColorsThemePrincipalModel() {
    return _colorsThemePrincipalModel;
  }

  setNewPassword(String newPassword){
    _newPassword = newPassword;
  }

  setReplyPassword(String replyPassword){
    _replyPassword = replyPassword;
  }

  setWidth(double newWidth) {
    _width = newWidth;
  }

  setHeight(double newHeight) {
    _height = newHeight;
  }
}
