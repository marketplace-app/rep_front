// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable
import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/rpe_controller.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/atomic/input_generic.dart';
import 'package:marketplace/src/views/components/atomic/subtittle_component_view.dart';
import 'package:marketplace/src/views/components/atomic/title_text_component_view.dart';
import 'package:marketplace/src/views/components/templates/login_recover/login_recover_mobile_component_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RpeMobileView extends StatefulWidget {
  RpeController controller;
  RpeMobileView({super.key, required this.controller});

  @override
  State<RpeMobileView> createState() => _RpeMobileViewState();
}

class _RpeMobileViewState extends State<RpeMobileView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    widget.controller.retrievelInputs();

    return LoginRecoverMobileComponentView(
      image: 'assets/image/logo.png',
      widthImage: 150,
      heightImage: 150,
      listWidgets: [
        TitleTextComponentView(
            tittleText: "Poxa, Fica Tranquilo!", fontSize: 20),
        SubTittleComponentView(
            tittleText:
                "Basta digitar o seu e-mail cadastrado para que possamos enviar um código de segurança",
            fontSize: 15),
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
