import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

// this component put the buttons in line and will be called in the Kboard component

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;
  ButtonRow(this.buttons);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, b) {
          list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
          return list;
        }),
      ),
    );
  }
}
