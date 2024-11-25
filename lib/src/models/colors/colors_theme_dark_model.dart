
// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';

class ColorsThemePrincipalModel {
  ///Cores de background de paginas e botões
  Color _colorBackgroundPrimary = Color(0xFF3A57E8);
  Color _colorBackgroundSecundary = Color(0xFF3A8EE8);
  Color _colorBackgroundTerceary = Colors.black;
  Color _colorBackgroundQuaternary = Colors.white;
  ///Cores dos títulos
  Color _colorTittlePrimary = Colors.black;
  Color _colorTittleSecundary = Colors.white;
  Color _colorTittleTerceary = Color(0xFF3A57E8);
  //Cores dos subtítulos
  Color _colorSubTittlePrimary = Colors.black;
  Color _colorSubTittleSecundary = Colors.white;
  Color _colorSubTittleTerceary = Color(0xFF3A57E8);
  //Cores do background dos botão quando o mouse por cima
  Color _colorBackgroudButtonHover1 = Color(0xFF293DAA);
  Color _colorBackgroudButtonHover2 = Color(0xFF1D4B7A);
  Color _colorBackgroudButtonHover3 = Color(0xFF481D70);
  //Cores das bordas
  Color _colorBorderPrimary = Color(0xFF3A57E8);
  Color _colorBorderSecundary = Color(0xFF3A8EE8);
  Color _colorBorderTerceary = Colors.black;
  Color _colorBorderQuaternary = Colors.white;

  ColorsThemePrincipalModel();

  //GETs
  ///Cores de background de paginas e botões
  getColorBackgroudPrimary() {
    return _colorBackgroundPrimary;
  }

  getColorBackgroudSecundary() {
    return _colorBackgroundSecundary;
  }

  getColorBackgroundTerceary() {
    return _colorBackgroundTerceary;
  }

  getColorBackgroundQuaternary() {
    return _colorBackgroundQuaternary;
  }
  ///Cores dos títulos
  getColorTittlePrimary() {
    return _colorTittlePrimary;
  }

  getColorTittleSecundary() {
    return _colorTittleSecundary;
  }

  getColorTittleTerceary() {
    return _colorTittleTerceary;
  }
  //Cores dos subtitulos
  getColorSubTittlePrimary() {
    return _colorSubTittlePrimary;
  }

  getColorSubTittleSecundary() {
    return _colorSubTittleSecundary;
  }

  getColorSubTittleTerceary() {
    return _colorSubTittleTerceary;
  }


  //Cores backgroundButton
  getColorBackgroundButtonHover1() {
    return _colorBackgroudButtonHover1;
  }

  getColorBackgroundButtonHover2() {
    return _colorBackgroudButtonHover2;
  }

  getColorBackgroundButtonHover3() {
    return _colorBackgroudButtonHover3;
  }

  //Cores das bordas dos inputs
  getColorBorderPrimary(){
    return _colorBorderPrimary;
  }

  getColorBorderSecundary(){
    return _colorBorderSecundary;
  }

  getColorBorderTerceary(){
    return _colorBorderTerceary;
  }

  getColorBorderQuaternary(){
    return _colorBorderQuaternary;
  }



  //SETs
  ///Cores de background de paginas e botões

  setColorBackgroundPrimary(Color newColorBackgroundPrimary) {
    _colorBackgroundPrimary = newColorBackgroundPrimary;
  }

  setColorBackgroundSecundary(Color newColorBackgroundSecundary) {
    _colorBackgroundSecundary = newColorBackgroundSecundary;
  }

  setColorBackgroundTerceary(Color newColorBackgroundTerceary) {
    _colorBackgroundTerceary = newColorBackgroundTerceary;
  }

  setColorBackgroundQuaternary(Color newColorBackgroundQuaternary) {
    _colorBackgroundQuaternary = newColorBackgroundQuaternary;
  }

  //Cores dos subtitulos
  setColorSubTittlePrimary(Color newColorBackgroundPrimary) {
    _colorTittlePrimary = newColorBackgroundPrimary;
  }

  setColorSubTittleSecundary(Color newColorBackgroundSecundary) {
    _colorTittleSecundary = newColorBackgroundSecundary;
  }

  setColorSubTittleTerceary(Color newColorSubTittleTerceary) {
    _colorTittleTerceary = newColorSubTittleTerceary;
  }

  //Cores dos Títulos
  setColorTittlePrimary(Color newColorTitlePrimary){
    _colorTittlePrimary = newColorTitlePrimary;
  }

  setColorTittleSecundary(Color newColorTittleSecundary){
    _colorTittleSecundary = newColorTittleSecundary;
  }

  setColorTittleTerceary(Color newColorTittleTerceary){
    _colorTittleTerceary = newColorTittleTerceary;
  }

  //Cor de background dos botões hover
  setColorBackgroundButtonHover1(Color newColorBackgroundButtonHover1) {
    _colorBackgroudButtonHover1 = newColorBackgroundButtonHover1;
  }

  setColorBackgroundButtonHover2(Color newColorBackgroundButtonHover2) {
    _colorBackgroudButtonHover2 = newColorBackgroundButtonHover2;
  }

  setColorBackgroundButtonHover3(Color newColorBackgroundButtonHover3) {
    _colorBackgroudButtonHover3 = newColorBackgroundButtonHover3;
  }

  ///Cores das bordas de input
  setColorBorderPrimary(Color newColorBorderPrimary){
    _colorBorderPrimary = newColorBorderPrimary;
  }

  setColorBorderSecundary(Color newColorBorderSecundary){
    _colorBorderSecundary = newColorBorderSecundary;
  }

  setColorBorderTerceary(Color newColorBorderTerceary){
    _colorBorderTerceary = newColorBorderTerceary;
  }

  setColorBorderQuaternary(Color newColorBorderQuartenary){
    _colorBorderQuaternary = newColorBorderQuartenary;
  }

}
