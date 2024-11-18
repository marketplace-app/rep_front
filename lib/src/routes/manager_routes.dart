import 'package:marketplace/src/controllers/add_itens_controller.dart';
import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:marketplace/src/controllers/rpc_controller.dart';
import 'package:marketplace/src/controllers/rpe_controller.dart';
import 'package:marketplace/src/controllers/rpn_controller.dart';
import 'package:marketplace/src/models/person_model.dart';
import 'package:flutter/material.dart';

class ManagerRoutes {
  static PersonModel? user;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginController().getLoginView());
      case '/additens':
        return MaterialPageRoute(
            builder: (_) => AddItensController().showView());
      case '/recoverpassword':
        return MaterialPageRoute(
            builder: (_) =>
                RpeController().getRpeView());
      case '/recoverpasswordcode':
        return MaterialPageRoute(builder: (_) => RpcController().getRpcView());
      case '/recoverpasswordnew':
        return MaterialPageRoute(builder: (_) => RpnController().getRpnView());
      default:
        return MaterialPageRoute(builder: (_) => LoginController().getLoginView());
    }
  }
}
