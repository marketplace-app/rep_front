import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
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
      height: 160,
      decoration: BoxDecoration(
        color: color.getColorTheme().getColorBackgroundQuaternary(),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent, width: 1), // Borda azul
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Imagem do imóvel
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/image/casaexemplo.png', // Substituir pelo caminho correto da imagem
                  width: 100,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Informações do imóvel
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Título do imóvel
                  Text(
                    "Casa 15x9 Sem Garagem",
                    style: TextStyle(
                      color: color.getColorTheme().getColorTittlePrimary(),
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Localização
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "Cidade, Estado, País",
                        style: TextStyle(
                          color: color.getColorTheme().getColorTittlePrimary(),
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Detalhes adicionais
                  Row(
                    children: [
                      const Icon(Icons.info, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "Sem água, gás, luz",
                        style: TextStyle(
                          color: color.getColorTheme().getColorTittlePrimary(),
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Preço e botão
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Preço
                      Text(
                        UtilBrasilFields.obterReal(
                            650,
                            moeda: true),
                        style: TextStyle(
                            color:  color.getColorTheme().getColorTittleTerceary(),
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                       ButtonCardComponent()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
