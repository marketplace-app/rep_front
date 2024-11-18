import 'package:marketplace/src/controllers/color_theme_controller.dart';
import 'package:marketplace/src/controllers/login_controller.dart';
import 'package:marketplace/src/controllers/rpe_controller.dart';
import 'package:marketplace/src/controllers/rpn_controller.dart';
import 'package:marketplace/src/routes/manager_routes.dart';
import 'package:marketplace/src/routes/observer_routes.dart';
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

      ],
      // ignore: prefer_const_constructors
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [ObserverRoutes()],
        onGenerateRoute: ManagerRoutes.generateRoute,
        initialRoute: '/login',
      ),
    );
  }
}
