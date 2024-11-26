import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectFeaturesComponent extends StatefulWidget {
  List<String> list;
  Icon themeIcon;

  String placeHolder;
  SelectFeaturesComponent(this.placeHolder, this.themeIcon, this.list,
      {super.key});

  @override
  State<SelectFeaturesComponent> createState() =>
      _SelectFeaturesComponentState();
}

class _SelectFeaturesComponentState extends State<SelectFeaturesComponent> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    String dropDownValue = widget.list.first;

    return Align(
      child: ConstrainedBox(
        constraints:
            const BoxConstraints(maxWidth: 250, maxHeight: 45, minHeight: 45),
        child: Container(
            child: DropdownMenu<String>(
          // width: 250,
          hintText: widget.placeHolder,
          //requestFocusOnTap: true,
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.all(10),
            //constraints: BoxConstraints.expand(height: 45),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                width: 1.0,
                color: Color(0xFF929292),
              ),
            ),
          ),
          textStyle: const TextStyle(color: Color(0xFF929292)),
          onSelected: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropDownValue = value!;
            });
          },
          dropdownMenuEntries:
              widget.list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        )),
      ),
    );
  }
}
