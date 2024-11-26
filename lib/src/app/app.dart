import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/list_product_controller.dart';
import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:marketplace/src/controllers/rpe_controller.dart';
import 'package:marketplace/src/controllers/rpn_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => RpeController()),
        ChangeNotifierProvider(create: (_) => ColorThemeController(),),
        ChangeNotifierProvider(create: (_) => RpnController()),
        ChangeNotifierProvider(create: (_) => ListProductController())

      ],
      // ignore: prefer_const_constructors
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
       home: ListProductController().getListProductView(),
      )
      ,
    );
  }
}

