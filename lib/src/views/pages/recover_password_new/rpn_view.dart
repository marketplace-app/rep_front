// ignore_for_file: must_be_immutable

import 'package:marketplace/src/controllers/rpn_controller.dart';
import 'package:flutter/material.dart';

class RpnView extends StatelessWidget {
  RpnController controller;
  RpnView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    //Captura de lagura e altura da tela em tempo real
    controller
        .getRpnModel()
        ?.setWidth(MediaQuery.of(context).size.width);
    controller
        .getRpnModel()
        ?.setHeight(MediaQuery.of(context).size.height);
    double width = controller.getRpnModel()?.getWidth();
    double height = controller.getRpnModel()?.getHeight();

    //Validação de qual a tela será chamada para realizar a troca de layout
    if (height > 300 && height < 500 && width > 600) {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: controller.getRpnMobileInvertView(),
        ),
      );
    } else {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: controller.getRpnMobileView(),
        ),
      );
    }
  }
}
