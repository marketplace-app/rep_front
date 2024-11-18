import 'package:marketplace/src/views/components/atomic/addItens/select_features_component_view.dart';
import 'package:marketplace/src/views/components/atomic/card/input_search_component_view.dart';
import 'package:flutter/material.dart';

class SearchProductComponent extends StatefulWidget {
  const SearchProductComponent({super.key});

  @override
  State<SearchProductComponent> createState() => SearchProductComponentState();
}

class SearchProductComponentState extends State<SearchProductComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                flex: 1,
                child: InputSearchComponent(
                    "Pesquisar", const Icon(Icons.search))),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                flex: 1,
                child: SelectFeaturesComponent("Departamento",
                    const Icon(Icons.arrow_drop_down), const <String>[
                  "Padrão",
                  "Móveis",
                  "Eletrônicos",
                  "Cama, Mesa e Banho"
                ])),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                flex: 1,
                child: SelectFeaturesComponent(
                    "Grupo", const Icon(Icons.arrow_drop_down), const <String>[
                  "Padrão",
                  "Móveis",
                  "Eletrônicos",
                  "Cama, Mesa e Banho"
                ])),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                flex: 1,
                child: SelectFeaturesComponent("SubGrupo",
                    const Icon(Icons.arrow_drop_down), const <String>[
                  "Padrão",
                  "Móveis",
                  "Eletrônicos",
                  "Cama, Mesa e Banho"
                ])),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
