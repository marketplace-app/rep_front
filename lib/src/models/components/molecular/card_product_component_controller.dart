import 'package:marketplace/src/controllers/components/counter_product_component_controller.dart';
import 'package:marketplace/src/models/product_model.dart';
import 'package:marketplace/src/views/components/molecular/card_product_component_view.dart';

class CardProductComponentController {
  ProductModel? product;
  CardProductComponent? cardProductComponent;
  CounterProductComponentController? counterController;

  CardProductComponentController() {
    cardProductComponent = CardProductComponent();
    cardProductComponent?.controllerCard = this;
  }

  void _controller(ProductModel product) {
    this.product = product;
    counterController = CounterProductComponentController(product);
  }

  showComponent(ProductModel product) {
    _controller(product);
    return cardProductComponent;
  }
}
