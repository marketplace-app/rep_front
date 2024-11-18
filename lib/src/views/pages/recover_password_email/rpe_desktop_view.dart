// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/rpe_controller.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/atomic/input_generic.dart';
import 'package:marketplace/src/views/components/atomic/subtittle_component_view.dart';
import 'package:marketplace/src/views/components/atomic/title_text_component_view.dart';
import 'package:marketplace/src/views/components/templates/login_recover/login_recover_desktop_component_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RpeDesktopView extends StatefulWidget {
  RpeController controller;

  RpeDesktopView({super.key, required this.controller});

  @override
  State<RpeDesktopView> createState() => _RpeDesktopViewState();
}

class _RpeDesktopViewState extends State<RpeDesktopView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    widget.controller.retrievelInputs();

    return LoginRecoverDesktopComponentView(
      image: '../image/esqueci_senha.png',
      listWidgets: [
        TitleTextComponentView(
            tittleText: "Poxa, Fica Tranquilo!", fontSize: 30),
        SubTittleComponentView(
            tittleText:
                "Basta digitar o seu e-mail cadastrado para que possamos enviar um código de segurança",
            fontSize: 20),
        SingleChildScrollView(
          child: Form(
            key: widget.controller.formKey,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 15,
              children: [
                InputGeneric(
                  label: "Email",
                  controller: widget.controller.emailController,
                  fontSize: 15,
                  textInputAction: TextInputAction.done,
                  icon: Icon(Icons.email),
                  isDecimal: false,
                  isPassword: false,
                  observePassword: false,
                  validatorInput: (String? email) {
                    return widget.controller.validateEmail(email);
                  },
                  list: const [],
                  functionIncrement: (String email) {
                    widget.controller.getRpeModel()?.setEmail(email);
                    widget.controller.saveData();
                  },
                  functionIcon: () {},
                  colorLabel: color.getColorTheme().getColorTittlePrimary(),
                  colorCounter: color.getColorTheme().getColorTittleSecundary(),
                  colorCursor: color.getColorTheme().getColorTittlePrimary(),
                  colorInput: color.getColorTheme().getColorTittlePrimary(),
                  colorBorder: color.getColorTheme().getColorBorderTerceary(),
                  colorBorderFocused:
                      color.getColorTheme().getColorBorderPrimary(),
                ),
                ButtonGeneric(
                  nameButton: "Receber código",
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  borderRadius: BorderRadius.circular(20),
                  font: 15,
                  backgroundColor:
                      color.getColorTheme().getColorBackgroudPrimary(),
                  titleColor: color.getColorTheme().getColorTittleSecundary(),
                  controller: widget.controller,
                  loading: widget.controller.loading,
                  function: () {
                    widget.controller.sendEmail(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
      function: (KeyEvent event) {
        final key = event.logicalKey.keyLabel;
        if (event is KeyDownEvent) {
          if (key.toString() == "Enter") {
            widget.controller.sendEmail(context);
          }
        }
        return false;
      },
    );
  }
}
