// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/rpn_controller.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/atomic/input_generic.dart';
import 'package:marketplace/src/views/components/atomic/title_text_component_view.dart';
import 'package:marketplace/src/views/components/templates/login_recover/login_recover_mobile_component_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RpnMobileView extends StatefulWidget {
  RpnController controller;
  RpnMobileView({super.key, required this.controller});

  @override
  State<RpnMobileView> createState() => _RpnMobileViewState();
}

class _RpnMobileViewState extends State<RpnMobileView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    widget.controller.retrievelInputs();

    return LoginRecoverMobileComponentView(
      image: '../image/digite_nova_senha.png',
      listWidgets: [
        TitleTextComponentView(
            tittleText: "Digite sua nova senha!", fontSize: 20),
        SingleChildScrollView(
          child: Form(
            key: widget.controller.formKey,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 15,
              spacing: 500,
              children: [
                InputGeneric(
                    label: "Nova Senha",
                    fontSize: 18,
                    textInputAction: TextInputAction.next,
                    controller: widget.controller.newPasswordController,
                    icon: Icon(Icons.visibility),
                    isDecimal: false,
                    isPassword: true,
                    observePassword: true,
                    validatorInput: (String? newPassword) {
                      return widget.controller.validateNewPassword(newPassword);
                    },
                    list: const [],
                    functionIncrement: (String newPassword) {
                      widget.controller
                          .getRpnModel()
                          ?.setNewPassword(newPassword);
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
                InputGeneric(
                    label: "Repita a Nova Senha",
                    fontSize: 18,
                    textInputAction: TextInputAction.done,
                    controller: widget.controller.replayPasswordController,
                    icon: Icon(Icons.visibility),
                    isDecimal: false,
                    isPassword: true,
                    observePassword: true,
                    validatorInput: (String? replayNewPassword) {
                      return widget.controller
                          .validateReplyPassword(replayNewPassword);
                    },
                    list: const [],
                    functionIncrement: (String replyPassword) {
                      widget.controller
                          .getRpnModel()
                          ?.setReplyPassword(replyPassword);
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
                    nameButton: "Alterar senha",
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
                      widget.controller.sendNewPassword(context);
                    }),
                ButtonGeneric(
                  nameButton: "Cancelar",
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  borderRadius: BorderRadius.circular(20),
                  font: 18,
                  backgroundColor:
                      color.getColorTheme().getColorBackgroudSecundary(),
                  titleColor:
                      color.getColorTheme().getColorSubTittleSecundary(),
                  controller: widget.controller,
                  loading: widget.controller.loading,
                  function: () {
                    widget.controller.returnLogin(context);
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
            widget.controller.sendNewPassword(context);
          }
        }
        return false;
      },
    );
  }
}
