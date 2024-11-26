import 'package:marketplace/src/controllers/add_itens_controller.dart';
import 'package:marketplace/src/views/components/molecular/search_product_component_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddItensView extends StatefulWidget {
  AddItensController controller;

  AddItensView({super.key, required this.controller});

  @override
  State<AddItensView> createState() => _AddItensViewState();
}

class _AddItensViewState extends State<AddItensView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 203, 203),
      body: SingleChildScrollView(
        child: Align(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SearchProductComponent(),
              ),
              //LINHAS DE PRODUTOS

              Wrap(
                direction: Axis.horizontal,
                spacing: 20,
                runSpacing: 20,
                children: [
                  for (int count = 0;
                      count < widget.controller.products!.length;
                      count++)
                    widget.controller
                        .showComponent(widget.controller.products![count])
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
