// ignore_for_file: must_be_immutable

import 'package:marketplace/src/controllers/rpc_controller.dart';
import 'package:flutter/material.dart';

class RpcView extends StatefulWidget {
  RpcController controller;
  RpcView({super.key, required this.controller});

  @override
  State<RpcView> createState() => _RpcViewState();
}

class _RpcViewState extends State<RpcView> {
  @override
  Widget build(BuildContext context) {
    widget.controller
        .getRpcModel()
        ?.setWidth(MediaQuery.of(context).size.width);
    widget.controller
        .getRpcModel()
        ?.setHeight(MediaQuery.of(context).size.height);
    double width = widget.controller.getRpcModel()?.getWidth();
    double height = widget.controller.getRpcModel()?.getHeight();

    if (height > 300 && height < 500 && width > 600) {
      return Scaffold(
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: widget.controller.getRpcMobileInvertView()),
      );
    } else if (width > 700) {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: widget.controller.getRpcDesktopView(),
        ),
      );
    } else {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: widget.controller.getRpcMobileView(),
        ),
      );
    }
  }
}
