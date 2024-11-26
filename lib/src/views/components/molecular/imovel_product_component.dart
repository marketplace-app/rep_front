import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/views/components/atomic/card/button_card_component_view.dart';
import 'package:provider/provider.dart';

class ImovelProductComponent extends StatefulWidget {
  const ImovelProductComponent({super.key});

  @override
  State<ImovelProductComponent> createState() => _ImovelProductComponentState();
}

class _ImovelProductComponentState extends State<ImovelProductComponent> {
  @override
  Widget build(BuildContext context) {
    ColorThemeController color = context.watch<ColorThemeController>();
    return Container(
      width: 375,
      height: 170,
      decoration: BoxDecoration(
          color: color.getColorTheme().getColorBackgroudSecundary(),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nome da Casa",
                    style: TextStyle(
                        color: color.getColorTheme().getColorTittlePrimary(),
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    UtilBrasilFields.obterReal(50, moeda: true),
                    style: const TextStyle(
                        color: Color(0xFFF47420),
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonCardComponent(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
