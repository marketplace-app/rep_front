import 'package:flutter/material.dart';
import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:provider/provider.dart';

class ListProductsMobileTemplate extends StatefulWidget {
  List listWidgetsDisplay = [];
  List listWidgetsDrawer = [];

  ListProductsMobileTemplate({
    super.key,
    required this.listWidgetsDisplay,
    required this.listWidgetsDrawer,
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

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
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
                    'assets/image/logonova.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'APP NOVO',
                    style: TextStyle(
                      color: color.getColorTheme().getColorTittleSecundary(),
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold)
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
            child: Container(
              color: color.getColorTheme().getColorBackgroudPrimary(),
              child: Container(
                decoration: BoxDecoration(
                  color: color.getColorTheme().getColorBackgroundQuaternary(),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15, 
                    vertical: 10,
                  ),
                  itemCount: widget.listWidgetsDisplay.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: widget.listWidgetsDisplay[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
