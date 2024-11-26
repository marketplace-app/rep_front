
import 'package:marketplace/src/models/components/molecular/card_product_component_controller.dart';
import 'package:marketplace/src/models/product_model.dart';
import 'package:marketplace/src/views/pages/add_itens/add_itens_view.dart';

class AddItensController {
  List? products;
  AddItensView? addItensView;

  AddItensController() {
    addItensView = AddItensView(controller: this);
  }

  alimentarLista() {
    products = [];
    for (var count = 0; count < 30; count++) {
      products?.add(ProductModel(
          "NOTEBOOK ACER 15.6 A5154-54-3 PRETO Intel Core i3 4GB",
          "https://images.pexels.com/photos/7974/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          "0200120001",
          10,
          2999.00));
    }
  }

  showComponent(ProductModel product) {
    return CardProductComponentController().showComponent(product);
  }

  showView() {
    alimentarLista();
    return addItensView;
  }
}
