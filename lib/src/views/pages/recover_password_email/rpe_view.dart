// ignore_for_file: camel_case_types, must_be_immutable, no_leading_underscores_for_local_identifiers

import 'package:marketplace/src/controllers/rpe_controller.dart';
import 'package:flutter/material.dart';

class RpeView extends StatelessWidget {
  RpeController controller;
  RpeView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    //Captura de lagura e altura da tela em tempo real
    controller.getRpeModel()?.setWidth(MediaQuery.of(context).size.width);
    controller.getRpeModel()?.setHeight(MediaQuery.of(context).size.height);
    double _width = controller.getRpeModel()?.getWidth();
    double _height = controller.getRpeModel()?.getHeight();

    //Validação de qual a tela será chamada para realizar a troca de layout
    if (_height > 300 && _height < 500 && _width > 600) {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: controller.getRpeMobileInvertView(),
        ),
      );
    } else if (_width > 700) {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: controller.getRpeDesktopView(),
        ),
      );
    } else {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: controller.getRpeMobileView(),
        ),
      );
    }
  }
}
