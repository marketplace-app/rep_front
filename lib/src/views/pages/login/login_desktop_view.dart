// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/atomic/forgot_password_component_view.dart';
import 'package:marketplace/src/views/components/atomic/input_generic.dart';
import 'package:marketplace/src/views/components/atomic/subtittle_component_view.dart';
import 'package:marketplace/src/views/components/atomic/title_text_component_view.dart';
import 'package:marketplace/src/views/components/templates/login_recover/login_recover_desktop_component_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginDesktopView extends StatefulWidget {
  LoginController controller;
  LoginDesktopView({super.key, required this.controller});

  @override
  State<LoginDesktopView> createState() => _LoginDesktopViewState();
}

class _LoginDesktopViewState extends State<LoginDesktopView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    widget.controller.retrievelInputs();

    return LoginRecoverDesktopComponentView(
      image: '../image/robo_desktop.png',
      listWidgets: [
        TitleTextComponentView(
            tittleText: "Olá, seja bem-vindo!", fontSize: 30.0),
        SubTittleComponentView(
            tittleText:
                "Digite o seu usuário e senha para acessar a plataforma.",
            fontSize: 18.0),
        SingleChildScrollView(
          child: Form(
            key: widget.controller.formKey,
            child: Wrap(
              spacing: 20,
              alignment: WrapAlignment.center,
              runSpacing: 20,
              children: [
                InputGeneric(
                  label: "Usuário",
                  fontSize: 18,
                  textInputAction: TextInputAction.next,
                  icon: Icon(Icons.email),
                  isDecimal: false,
                  isPassword: false,
                  observePassword: false,
                  controller: widget.controller.userController,
                  validatorInput: (String? user) {
                    return widget.controller.validateInputUser(user);
                  },
                  list: const [],
                  functionIncrement: (user) {
                    widget.controller.getLoginModel()?.setUser(user);
                    widget.controller.saveData();
                  },
                  functionIcon: () {},
                  colorLabel: color.getColorTheme().getColorTittlePrimary(),
                  colorCounter: color.getColorTheme().getColorTittlePrimary(),
                  colorCursor: color.getColorTheme().getColorTittlePrimary(),
                  colorInput: color.getColorTheme().getColorTittlePrimary(),
                  colorBorder: color.getColorTheme().getColorBorderTerceary(),
                  colorBorderFocused:
                      color.getColorTheme().getColorBorderPrimary(),
                ),
                InputGeneric(
                    label: "Senha",
                    fontSize: 18,
                    textInputAction: TextInputAction.done,
                    icon: Icon(Icons.visibility),
                    isDecimal: false,
                    isPassword: true,
                    observePassword: true,
                    controller: widget.controller.passwordController,
                    validatorInput: (String? password) {
                      return widget.controller.validateInputPassword(password);
                    },
                    list: const [],
                    functionIncrement: (password) {
                      widget.controller.getLoginModel()?.setPassword(password);
                      widget.controller.saveData();
                    },
                    functionIcon: () {},
                    colorLabel: color.getColorTheme().getColorTittlePrimary(),
                    colorCounter: color.getColorTheme().getColorTittlePrimary(),
                    colorCursor: color.getColorTheme().getColorTittlePrimary(),
                    colorInput: color.getColorTheme().getColorTittlePrimary(),
                    colorBorder: color.getColorTheme().getColorBorderTerceary(),
                    colorBorderFocused:
                        color.getColorTheme().getColorBorderPrimary()),
                ButtonGeneric(
                    nameButton: "Entrar",
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    borderRadius: BorderRadius.circular(20),
                    font: 18,
                    backgroundColor:
                        color.getColorTheme().getColorBackgroudPrimary(),
                    titleColor:
                        color.getColorTheme().getColorSubTittleSecundary(),
                    controller: widget.controller,
                    loading: widget.controller.loading,
                    function: () {
                      widget.controller.validateUser(context);
                    }),
              ],
            ),
          ),
        ),
        ForgotPasswordComponentView(),
        //StopWatchAtomic()
      ],
      function: (KeyEvent event) {
        final key = event.logicalKey.keyLabel;
        if (event is KeyDownEvent) {
          if (key.toString() == "Enter") {
            widget.controller.validateUser(context);
          }
        }
        return false;
      },
    );
  }
}
