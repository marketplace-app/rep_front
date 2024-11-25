// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/atomic/input_generic.dart';
import 'package:marketplace/src/views/components/atomic/forgot_password_component_view.dart';
import 'package:marketplace/src/views/components/atomic/subtittle_component_view.dart';
import 'package:marketplace/src/views/components/templates/login_recover/login_recover_mobile_component_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../components/atomic/title_text_component_view.dart';

class LoginMobileView extends StatefulWidget {
  LoginController controller;
  LoginMobileView({super.key, required this.controller});

  @override
  State<LoginMobileView> createState() => LoginMobileViewState();

  getWidthPage() {}
}

class LoginMobileViewState extends State<LoginMobileView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    widget.controller.retrievelInputs();

    return Scaffold(
        resizeToAvoidBottomInset: true,
       body : LoginRecoverMobileComponentView(
      image: 'assets/image/logo.png',
      heightImage: 150,
      widthImage: 150,
      listWidgets: [
        TitleTextComponentView(
            tittleText: "Olá, seja bem-vindo!", fontSize: 20.0),
        SubTittleComponentView(
            tittleText:
                "Digite o seu nome de usuário e a sua senha para reservar aluguéis",
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
                    fontSize: 15,
                    textInputAction: TextInputAction.next,
                    icon: Icon(Icons.person),
                    isDecimal: false,
                    isPassword: false,
                    observePassword: false,
                    validatorInput: (String? user) {
                      return widget.controller.validateInputUser(user);
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
    )
    );
  }
}
