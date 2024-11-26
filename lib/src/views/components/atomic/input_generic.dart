// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputGeneric extends StatefulWidget {
  String label;
  double fontSize;
  Icon icon;
  TextInputAction textInputAction;
  bool observePassword;
  bool isDecimal;
  bool isPassword;
  TextEditingController controller;
  Function validatorInput;
  List list = [];
  Function functionIncrement;
  VoidCallback functionIcon;
  Color colorLabel;
  Color colorCounter;
  Color colorCursor;
  Color colorInput;
  Color colorBorder;
  Color colorBorderFocused;

  InputGeneric({
    super.key,
    required this.label,
    required this.fontSize,
    required this.textInputAction,
    required this.icon,
    required this.isDecimal,
    required this.isPassword,
    required this.controller,
    required this.validatorInput,
    required this.observePassword,
    required this.list,
    required this.functionIncrement,
    required this.functionIcon,
    required this.colorLabel,
    required this.colorCounter,
    required this.colorCursor,
    required this.colorInput,
    required this.colorBorder,
    required this.colorBorderFocused,
  }) {
    //controller.text = '';
  }

  @override
  State<InputGeneric> createState() => _InputGenericState();
}

class _InputGenericState extends State<InputGeneric> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        onChanged: (e) {
          widget.functionIncrement(e);
        },
        textInputAction: widget.textInputAction,
        style: TextStyle(fontSize: widget.fontSize),
        cursorColor: widget.colorCursor,
        obscureText: widget.observePassword,
        textAlign: TextAlign.left,
        keyboardType:
            TextInputType.numberWithOptions(decimal: widget.isDecimal),
        inputFormatters: <TextInputFormatter>[
          for (int count = 0; count < widget.list.length; count++)
            widget.list[count]
        ],
        validator: (String? value) {
          return widget.validatorInput(value);
        },
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle:
              TextStyle(color: widget.colorLabel, fontSize: widget.fontSize),
          counterStyle:
              TextStyle(color: widget.colorCounter, fontSize: widget.fontSize),
          suffixIcon: IconButton(
            icon: widget.icon,
            onPressed: () {
              if (widget.isPassword == true &&
                  widget.observePassword == false) {
                setState(() {
                  widget.observePassword = true;
                  widget.icon = Icon(Icons.visibility);
                });
              } else if (widget.isPassword == true &&
                  widget.observePassword == true) {
                setState(() {
                  widget.observePassword = false;
                  widget.icon = Icon(Icons.visibility_off);
                });
              } else if (widget.isPassword == true &&
                  widget.observePassword == true) {
                setState(() {
                  widget.observePassword = false;
                  widget.icon = Icon(Icons.visibility);
                });
              }
            },
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.colorBorder)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.colorBorderFocused)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.colorBorderFocused)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.colorBorderFocused)),
        ));
  }
}
