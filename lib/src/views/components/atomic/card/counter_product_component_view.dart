import 'package:marketplace/src/controllers/components/counter_product_component_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class CounterProductComponentView extends StatefulWidget {
  CounterProductComponentController? controller;
  CounterProductComponentView({super.key});

  @override
  State<CounterProductComponentView> createState() =>
      _CounterProductComponentState();
}

class _CounterProductComponentState extends State<CounterProductComponentView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController counterInput = TextEditingController();
    //var controller = context.watch<CounterProductComponentController>();

    return SizedBox(
      height: 50,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 25,
              width: 30,
              child: ElevatedButton(
                style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: const WidgetStatePropertyAll(Colors.red),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric()),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.zero,
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.zero)))),
                onPressed: () {
                  setState(() {
                    widget.controller?.decrement();
                  });
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              )),
          SizedBox(
            height: 25,
            width: 35,
            child: TextFormField(
              onChanged: (e) {
                widget.controller?.counterModel!.counter =
                    int.parse(counterInput.text);
              },
              cursorColor: Colors.black,
              controller: counterInput,
              textAlign: TextAlign.center,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3)
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.controller?.getCounter(),
                hoverColor: Colors.black,
              ),
            ),
          ),
          SizedBox(
              height: 25,
              width: 30,
              child: ElevatedButton(
                style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: const WidgetStatePropertyAll(Colors.red),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric()),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.circular(10))))),
                onPressed: () {
                  setState(() {
                    widget.controller?.increment();
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
