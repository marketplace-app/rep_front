// ignore_for_file: must_be_immutable

///Classe inicial da tela de login, é por meio dela que é gerenciado a largura e altura da tela em tempo real para realizar a troca de layout que pode ser mobile, desktop ou mobile invertido.
///[LoginController] é necessário obrigatoriamente para realizar a conexão com o controlador por isso ele é instanciado no construtor do controller por meio do this
library;

import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  LoginController controller;
  LoginView({super.key, required this.controller});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    widget.controller
        .getLoginModel()
        ?.setWidth(MediaQuery.of(context).size.width);
    widget.controller
        .getLoginModel()
        ?.setHeight(MediaQuery.of(context).size.height);
    double width = widget.controller.getLoginModel()?.getWidth();
    double height = widget.controller.getLoginModel()?.getHeight();

    if (height > 300 && height < 500 && width > 600) {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: widget.controller.getLoginMobileInvertView(),
        ),
      );
    } else if (width > 700) {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: widget.controller.getLoginDesktopView(),
        ),
      );
    } else {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: widget.controller.getLoginMobileView(),
        ),
      );
    }
  }
}
