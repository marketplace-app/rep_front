import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginRecoverMobileInvertComponentView extends StatefulWidget {
  List listWidgets = [];
  String image;
  bool Function(KeyEvent) function;
  LoginRecoverMobileInvertComponentView(
      {super.key,
      required this.image,
      required this.listWidgets,
      required this.function});

  @override
  State<LoginRecoverMobileInvertComponentView> createState() =>
      _LoginRecoverDesktopComponentViewState();
}

class _LoginRecoverDesktopComponentViewState
    extends State<LoginRecoverMobileInvertComponentView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    ServicesBinding.instance.keyboard.addHandler(widget.function);

    return Scaffold(
      body: Container(
        color: color.getColorTheme().getColorBackgroudPrimary(),
        child: Align(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1920, maxHeight: 1080),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: color.getColorTheme().getColorBackgroudPrimary(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0.0),
                      child: Align(
                        child: Image.asset(widget.image),
                      ),
                      //child: Image(image: ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: color.getColorTheme().getColorBackgroudPrimary(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: color
                              .getColorTheme()
                              .getColorBackgroundQuaternary(),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              child: Align(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  child: Wrap(
                                    spacing: 500,
                                    runSpacing: 15,
                                    alignment: WrapAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      for (int count = 0;
                                          count < widget.listWidgets.length;
                                          count++)
                                        widget.listWidgets[count]
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
