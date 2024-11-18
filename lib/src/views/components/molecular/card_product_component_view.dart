import 'package:marketplace/src/models/components/molecular/card_product_component_controller.dart';
import 'package:marketplace/src/views/components/atomic/addItens/stock_code_product_component_view.dart';
import 'package:marketplace/src/views/components/atomic/card/button_card_component_view.dart';
import 'package:marketplace/src/views/components/atomic/card/image_product_component_view.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardProductComponent extends StatefulWidget {
  CardProductComponentController? controllerCard;
  CardProductComponent({super.key});

  @override
  State<CardProductComponent> createState() => _CardProductComponentState();
}

class _CardProductComponentState extends State<CardProductComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 320,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //IMAGEM DO PRODUTO
            ImageProductComponent(
                linkFtp: widget.controllerCard!.product?.getImageProduct()),

            const SizedBox(
              height: 10,
            ),

            //NOME DO PRODUTO
            Text(
              widget.controllerCard!.product?.getNameProduct(),
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 10,
            ),

            //ESTOQUE E CÓDIGO DO PRODUTO
            StockCodeProduct(widget.controllerCard!.product?.getStockProduct(),
                widget.controllerCard!.product?.getCodeProduct()),

            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Text(
                  UtilBrasilFields.obterReal(
                      widget.controllerCard!.product?.getPriceProduct(),
                      moeda: true),
                  style: const TextStyle(
                      color: Color(0xFFF47420),
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            //CounterProductComponent()
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.controllerCard!.counterController?.showComponent(),
                ButtonCardComponent(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
