import 'package:flutter/material.dart';
import 'package:marketplace/src/controllers/rpe_controller.dart';
import 'package:provider/provider.dart';

import '../../../controllers/color_theme_controller.dart';
//import 'package:project01/src/controllers/login_controller.dart';
//import 'package:provider/provider.dart';

class ForgotPasswordComponentView extends StatefulWidget {
  const ForgotPasswordComponentView({super.key});

  @override
  State<ForgotPasswordComponentView> createState() =>
      _ForgotPasswordComponentViewState();
}

class _ForgotPasswordComponentViewState
    extends State<ForgotPasswordComponentView> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController colorTheme = context.watch<ColorThemeController>();
    //final controller = context.watch<LoginController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Esqueceu a senha?",
            style: TextStyle(
                backgroundColor: Colors.white,
                fontFamily: "Poppins",
                fontSize: 14)),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RpeController().getRpeView()));

            },
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Clique aqui!",
                style: TextStyle(
                    fontFamily: "Poppins", color: colorTheme.getColorTheme().getColorTittleTerceary(), fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
