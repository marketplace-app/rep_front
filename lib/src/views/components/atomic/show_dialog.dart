// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  String mensage;
  String tittleMensage;
  ShowDialog({super.key, required this.tittleMensage, required this.mensage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tittleMensage),
      content: Text(mensage),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fechar o diálogo
          },
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
