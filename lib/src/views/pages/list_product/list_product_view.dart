import 'package:flutter/material.dart';
import 'package:marketplace/src/controllers/list_product_controller.dart';

class ListProductView extends StatefulWidget {
  ListProductController controller;

  ListProductView({super.key, required this.controller});

  @override
  State<ListProductView> createState() => _ListProductViewState();
}

class _ListProductViewState extends State<ListProductView> {
  @override
  Widget build(BuildContext context) {

    widget.controller
        .getListProductModel()
        ?.setWidth(MediaQuery.of(context).size.width);
    widget.controller
        .getListProductModel()
        ?.setHeight(MediaQuery.of(context).size.height);
    double width = widget.controller.getListProductModel()?.getWidth();
    double height = widget.controller.getListProductModel()?.getHeight();

    if (height > 300 && height < 500 && width > 600) {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: widget.controller.getListProductMobileInvertView(),
        ),
      );
    }
    else {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: widget.controller.getListProductMobileView(),
        ),
      );
    }
  }
}