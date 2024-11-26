// ignore_for_file: must_be_immutable

import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubTittleComponentView extends StatefulWidget {
  String tittleText;
  double fontSize;
  SubTittleComponentView(
      {super.key, required this.tittleText, required this.fontSize});

  @override
  State<SubTittleComponentView> createState() => _SubTittleComponentViewState();
}

class _SubTittleComponentViewState extends State<SubTittleComponentView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    return Text(
      widget.tittleText,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: "Poppins",
          color: color.getColorTheme().getColorTittlePrimary(),
          fontSize: widget.fontSize,
          fontWeight: FontWeight.normal),
    );
  }
}
