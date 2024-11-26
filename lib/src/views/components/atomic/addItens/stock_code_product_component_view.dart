import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StockCodeProduct extends StatefulWidget {
  int stock;
  String codeProduct;
  StockCodeProduct(this.stock, this.codeProduct, {super.key});

  @override
  State<StockCodeProduct> createState() => _StockCodeProductState();
}

class _StockCodeProductState extends State<StockCodeProduct> {
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //CODIGO DO PRODUTO
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Cod: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                      Text(
                        widget.codeProduct,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  )
                ],
              ),

              //ESTOQUE DO PRODUTO
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Estoque: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                      Text(
                        widget.stock.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  )
                ],
              )
            ],
          );
  }
}