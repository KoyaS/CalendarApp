import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();

  final String fillerText;
  final TextStyle style;
  final InputDecoration inputDecoration;
  final bool customDecoration;
  final Function onTapFunc;
  final String heldText;
  final Function saveTaskFunc;
  List taskListRefrence;
  int index;

  TextInput(
      {@required this.fillerText,
      this.style = const TextStyle(),
      this.customDecoration = false,
      this.inputDecoration,
      this.onTapFunc,
      this.heldText,
      this.saveTaskFunc,});

  @override
  Widget build(BuildContext context) {

    controller.text = heldText;

    InputDecoration inDec;
    if(!customDecoration) {
      inDec = InputDecoration(
        hintText: this.fillerText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      );
    } else {
      inDec = inputDecoration;
    }

    return TextField(
      style: style,
      autofocus: true,
      cursorColor: Colors.black,
      decoration: inDec,
      controller: controller,
      onTap: onTapFunc,
    );
  }
}
