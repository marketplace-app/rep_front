//import 'package:flutter/material.dart';
import 'package:marketplace/src/models/components/atomic/counter_product_component_model.dart';
import 'package:marketplace/src/models/product_model.dart';
import 'package:marketplace/src/views/components/atomic/card/counter_product_component_view.dart';

//enum AuthState {idle, increment, decrement}

class CounterProductComponentController {
  CounterProductComponentModel? counterModel;
  CounterProductComponentView? counterView;

  CounterProductComponentController(ProductModel product) {
    counterModel = CounterProductComponentModel(product.getStockProduct());
    counterView = CounterProductComponentView();
    counterView?.controller = this;
  }

  void increment() {
    if (counterModel!.counter < counterModel!.stock) {
      counterModel!.counter = counterModel!.counter + 1;
    }
  }

  void decrement() {
    if (counterModel!.counter > 0) {
      counterModel!.counter = counterModel!.counter - 1;
    }
  }

  void inputIncrement(int input) {
    if (input < counterModel!.stock) {
      counterModel!.counter = input;
    } else {
      counterModel!.counter = counterModel!.counter;
    }
  }

  showComponent() {
    return counterView;
  }

  String getCounter() {
    return counterModel!.counter.toString();
  }
}
