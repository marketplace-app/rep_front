/*
* Template da tela padrão do sistema com cabeçalho, menu e campo aberto para a
* incrementar qualquer lista de widgets
*
* */


import 'package:marketplace/src/app/app.dart';
import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace/src/views/components/atomic/button_generic.dart';
import 'package:marketplace/src/views/components/molecular/header_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListProductsMobileTemplate extends StatefulWidget {
  List listWidgetsDisplay = [];
  List listWidgetsDrawer = [];
  //bool Function(KeyEvent) function;

  ListProductsMobileTemplate({super.key,
      required this.listWidgetsDisplay,
      required this.listWidgetsDrawer,
      //required this.function,
      });

  @override
  State<ListProductsMobileTemplate> createState() =>
      _ListProductsMobileTemplateState();
}

class _ListProductsMobileTemplateState
    extends State<ListProductsMobileTemplate> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    //ServicesBinding.instance.keyboard.addHandler(widget.function);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: color.getColorTheme().getColorBackgroudPrimary(),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: color.getColorTheme().getColorBackgroudPrimary(),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/image/logocorbranca.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'LarClick',
                    style: TextStyle(
                      color: color.getColorTheme().getColorTittleSecundary(),
                    ),
                  ),
                ],
              ),
            ),
            for (int count = 0;
            count < widget.listWidgetsDrawer.length;
            count++)
              widget.listWidgetsDrawer[count]
          ],
        ),
      ),
      body: Container(
        color: color.getColorTheme().getColorBackgroudPrimary(),
        child: Align(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 1080),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0))),
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
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  child: Wrap(
                                    spacing: 500,
                                    runSpacing: 15,
                                    alignment: WrapAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      for (int count = 0;
                                          count < widget.listWidgetsDisplay.length;
                                          count++)
                                        widget.listWidgetsDisplay[count]
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
