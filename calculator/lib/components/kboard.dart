import 'package:calculator/components/button.dart';
import 'package:calculator/components/button_row.dart';
import 'package:flutter/material.dart';

class KeyBoard extends StatelessWidget {
  final void Function(String) cb;
  KeyBoard(this.cb);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button.dark(text: 'C', cb: cb),
            Button.dark(text: '()', cb: cb),
            Button.dark(text: '%', cb: cb),
            Button.operation(text: '/', cb: cb),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button(text: '7', cb: cb),
            Button(text: '8', cb: cb),
            Button(text: '9', cb: cb),
            Button.operation(text: 'x', cb: cb),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button(text: '4', cb: cb),
            Button(text: '5', cb: cb),
            Button(text: '6', cb: cb),
            Button.operation(text: '-', cb: cb),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button(text: '1', cb: cb),
            Button(text: '2', cb: cb),
            Button(text: '3', cb: cb),
            Button.operation(text: '+', cb: cb),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button(text: '+/-', cb: cb),
            Button(text: '0', cb: cb),
            Button(text: '.', cb: cb),
            Button.equals(text: '=', cb: cb),
          ]),
        ],
      ),
    );
  }
}
