// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/rpc_controller.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/atomic/input_generic.dart';
import 'package:marketplace/src/views/components/atomic/subtittle_component_view.dart';
import 'package:marketplace/src/views/components/atomic/title_text_component_view.dart';
import 'package:marketplace/src/views/components/templates/login_recover/login_recover_desktop_component_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RpcDesktopView extends StatefulWidget {
  RpcController controller;
  RpcDesktopView({super.key, required this.controller});

  @override
  State<RpcDesktopView> createState() => _RpcDesktopViewState();
}

class _RpcDesktopViewState extends State<RpcDesktopView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    widget.controller.retrievelInputs();
    return LoginRecoverDesktopComponentView(
      image: '../image/verificacao_codigo.png',
      listWidgets: [
        TitleTextComponentView(tittleText: "Digite o seu código", fontSize: 30),
        SubTittleComponentView(
            tittleText:
                "Digite o código de segurança enviado para o seu e-mail para que possamos validar com segurança",
            fontSize: 20),
        SingleChildScrollView(
          child: Form(
            key: widget.controller.formKey,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 15,
              children: [
                InputGeneric(
                    label: "Código",
                    controller: widget.controller.codeController,
                    fontSize: 18,
                    textInputAction: TextInputAction.done,
                    icon: Icon(Icons.security),
                    isDecimal: false,
                    isPassword: false,
                    observePassword: false,
                    validatorInput: (String? code) {
                      return widget.controller.validateCode(code);
                    },
                    list: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                    functionIncrement: (String code) {
                      widget.controller.getRpcModel()?.setCode(code);
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
                  nameButton: "Enviar Código",
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  borderRadius: BorderRadius.circular(20),
                  font: 18,
                  backgroundColor:
                      color.getColorTheme().getColorBackgroudPrimary(),
                  titleColor: color.getColorTheme().getColorTittleSecundary(),
                  controller: widget.controller,
                  loading: widget.controller.loading,
                  function: () {
                    widget.controller.sendCode(context);

                  },
                )
              ],
            ),
          ),
        ),
      ],
      function: (KeyEvent event) {
        final key = event.logicalKey.keyLabel;
        if (event is KeyDownEvent) {
          if (key.toString() == "Enter") {
            widget.controller.sendCode(context);
          }
        }
        return false;
      },
    );
  }
}
