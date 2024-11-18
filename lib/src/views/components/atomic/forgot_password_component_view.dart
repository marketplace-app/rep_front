import 'package:flutter/material.dart';
//import 'package:project01/src/controllers/login_controller.dart';
//import 'package:provider/provider.dart';

class ForgotPasswordComponentView extends StatefulWidget {
  const ForgotPasswordComponentView({super.key});

  @override
  State<ForgotPasswordComponentView> createState() =>
      _ForgotPasswordComponentViewState();
}

class _ForgotPasswordComponentViewState
    extends State<ForgotPasswordComponentView> {
  @override
  Widget build(BuildContext context) {
    //final controller = context.watch<LoginController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Esqueceu a senha?",
            style: TextStyle(
                backgroundColor: Colors.white,
                fontFamily: "Poppins",
                fontSize: 14)),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/recoverpassword');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Clique aqui!",
                style: TextStyle(
                    fontFamily: "Poppins", color: Colors.orange, fontSize: 14),
              ),
            ),
          ),
        )
      ],
    );
  }
}
