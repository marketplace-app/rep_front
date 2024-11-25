// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/atomic/input_generic.dart';
import 'package:marketplace/src/views/components/atomic/forgot_password_component_view.dart';
import 'package:marketplace/src/views/components/atomic/subtittle_component_view.dart';
import 'package:marketplace/src/views/components/atomic/title_text_component_view.dart';
import 'package:marketplace/src/views/components/templates/login_recover/login_recover_mobile_invert_component_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginMobileInvertView extends StatefulWidget {
  LoginController controller;
  LoginMobileInvertView({super.key, required this.controller});

  @override
  State<LoginMobileInvertView> createState() => LoginMobileInvertViewState();

  getWidthPage() {}
}

class LoginMobileInvertViewState extends State<LoginMobileInvertView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    widget.controller.retrievelInputs();

    return LoginRecoverMobileInvertComponentView(
      image: '../image/robo_smartphone.png',
      listWidgets: [
        TitleTextComponentView(
            tittleText: "Olá, seja bem-vindo!", fontSize: 20),
        SubTittleComponentView(
            tittleText:
                "Digite o seu usuário e senha para acessar a plataforma TESTE",
            fontSize: 15),
        SingleChildScrollView(
          child: Form(
            key: widget.controller.formKey,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 15,
              children: [
                InputGeneric(
                    label: "Usuário",
                    controller: widget.controller.userController,
                    textInputAction: TextInputAction.next,
                    fontSize: 15,
                    icon: Icon(Icons.person),
                    isDecimal: false,
                    isPassword: false,
                    observePassword: false,
                    list: const [],
                    validatorInput: (String? user) {
                      return widget.controller.validateInputUser(user);
                    },
                    functionIncrement: (e) {},
                    functionIcon: () {},
                    colorLabel: color.getColorTheme().getColorTittlePrimary(),
                    colorCounter: color.getColorTheme().getColorTittlePrimary(),
                    colorCursor: color.getColorTheme().getColorTittlePrimary(),
                    colorInput: color.getColorTheme().getColorTittlePrimary(),
                    colorBorder: color.getColorTheme().getColorBorderTerceary(),
                    colorBorderFocused:
                        color.getColorTheme().getColorBorderPrimary()),
                InputGeneric(
                    label: "Senha",
                    controller: widget.controller.passwordController,
                    fontSize: 15,
                    textInputAction: TextInputAction.done,
                    icon: Icon(Icons.visibility),
                    isDecimal: false,
                    isPassword: true,
                    observePassword: true,
                    validatorInput: (String? password) {
                      return widget.controller.validateInputPassword(password);
                    },
                    list: const [],
                    functionIncrement: (e) {},
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
                  font: 15,
                  backgroundColor:
                      color.getColorTheme().getColorBackgroudPrimary(),
                  titleColor:
                      color.getColorTheme().getColorSubTittleSecundary(),
                  controller: widget.controller,
                  loading: widget.controller.loading,
                  function: () {
                    widget.controller.validateUser(context);
                  },
                ),
              ],
            ),
          ),
        ),
        ForgotPasswordComponentView(),
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
