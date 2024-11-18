import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TitleTextComponentView extends StatefulWidget {
  String tittleText;
  double fontSize;
  TitleTextComponentView(
      {super.key, required this.tittleText, required this.fontSize});

  @override
  State<TitleTextComponentView> createState() => _TitleTextComponentViewState();
}

class _TitleTextComponentViewState extends State<TitleTextComponentView> {
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
          fontWeight: FontWeight.bold),
    );
  }
}
