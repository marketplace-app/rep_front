import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputSearchComponent extends StatefulWidget {
  late TextEditingController inputController = TextEditingController();
  late String placeholder;
  late Icon themeIcon;

  InputSearchComponent(this.placeholder, this.themeIcon, {super.key});

  @override
  State<InputSearchComponent> createState() => _InputSearchComponentState();
}

class _InputSearchComponentState extends State<InputSearchComponent> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 45, maxWidth: 250),
        child: Container(
          //alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xFF929292), style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TextFormField(
                    cursorColor: const Color(0xFF929292),
                    controller: widget.inputController,
                    textAlign: TextAlign.left,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hoverColor: const Color(0xFF929292),
                        hintText: widget.placeholder,
                        labelStyle: const TextStyle(
                          color: Color(0xFF929292),
                          fontSize: 20,
                        )),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: widget.themeIcon,
                color: const Color(0xFF929292),
              )
            ],
          ),
        ),
      ),
    );
  }
}
