// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class ButtonGeneric extends StatefulWidget {
  String nameButton;
  EdgeInsets padding;
  BorderRadius borderRadius;
  double font;
  Color backgroundColor;
  Color titleColor;
  dynamic controller;
  VoidCallback? function;
  ValueNotifier loading;

  ButtonGeneric({
    super.key,
    required this.nameButton,
    required this.padding,
    required this.borderRadius,
    required this.font,
    required this.backgroundColor,
    required this.titleColor,
    required this.controller,
    required this.loading,
    required this.function,
  });

  @override
  State<ButtonGeneric> createState() => _ButtonGenericState();
}

class _ButtonGenericState extends State<ButtonGeneric> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.function,
      style: TextButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: widget.borderRadius,
        ),
        padding: widget.padding,
      ),
      onHover: (value) {},
      child: AnimatedBuilder(
        animation: widget.loading,
        builder: (context, _) {
          return widget.loading.value
              ? SizedBox(
                  width: 10,
                  height: 10,
                  child: CircularProgressIndicator(
                    color: widget.titleColor,
                  ))
              : Text(
                  widget.nameButton,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: widget.titleColor,
                      fontSize: widget.font,
                      fontFamily: "Poppins"),
                );
        },
      ),
    );
  }
}
