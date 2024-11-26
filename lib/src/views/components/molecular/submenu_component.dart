import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubmenuComponent extends StatefulWidget {
  const SubmenuComponent({super.key});

  @override
  State<SubmenuComponent> createState() => _SubmenuComponentState();
}

class _SubmenuComponentState extends State<SubmenuComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpansionTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title:  Text('Perfil'),
                  onTap: () {
                    // Ação ao clicar
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading:  Icon(Icons.security),
                  title:  Text('Segurança'),
                  onTap: () {
                    // Ação ao clicar
                    Navigator.pop(context);
                  },
                ),
              ],
            )


    );
    
  }
}