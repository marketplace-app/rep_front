import 'package:flutter/material.dart';
import 'package:marketplace/src/api/repositories/list_product_repository_api.dart';
import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:marketplace/src/models/list_product_model.dart';
import 'package:marketplace/src/views/pages/list_product/list_product_mobile_invert_view.dart';
import 'package:marketplace/src/views/pages/list_product/list_product_mobile_view.dart';
import 'package:marketplace/src/views/pages/list_product/list_product_view.dart';

class ListProductController extends ChangeNotifier {
  ListProductModel? _listProductModel;
  ListProductMobileView? _listProductMobileView;
  ListProductMobileInvertView? _listProductMobileInvertView;
  ListProductView? _listProductView;
  ListProductRepositoryApi _listProductRepositoryApi =
      ListProductRepositoryApi();
  ValueNotifier loading = ValueNotifier<bool>(false);

  ListProductController() {
    _listProductModel = ListProductModel();
    _listProductView = ListProductView(controller: this);
    _listProductMobileView = ListProductMobileView(listProductController: this);
    _listProductMobileInvertView = ListProductMobileInvertView();
    _listProductRepositoryApi = ListProductRepositoryApi();
  }

  getListProductModel() {
    return _listProductModel;
  }

  getListProductMobileView() {
    return _listProductMobileView;
  }

  getListProductMobileInvertView() {
    return _listProductMobileInvertView;
  }

  getListProductView() {
    return _listProductView;
  }

  getListProductRepositoryApi() {
    return _listProductRepositoryApi;
  }

  displayLogin(BuildContext context) {
    print("teste login");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginController().getLoginView()));
  }
}
