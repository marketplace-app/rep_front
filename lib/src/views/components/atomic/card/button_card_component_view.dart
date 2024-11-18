import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCardComponent extends StatefulWidget {
  const ButtonCardComponent({super.key});

  @override
  State<ButtonCardComponent> createState() => _ButtonCardComponentState();
}

class _ButtonCardComponentState extends State<ButtonCardComponent> {
  late String textButton = "Adicionar";

  late Color colorButton = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      ),
      child: Text(
        textButton,
        style: const TextStyle(
          //fontSize: 7,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        setState(() {
          if (textButton == "Adicionar") {
            textButton = "Remover";
            colorButton = Colors.red;
          } else {
            textButton = "Adicionar";
            colorButton = Colors.orange;
          }
        });
      },
    );
  }
}
