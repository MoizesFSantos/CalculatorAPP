import 'package:flutter/material.dart';

// all buttons is here

class Button extends StatelessWidget {
  // different colors to different buttons ;)
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(236, 173, 111, 0.9);
  static const EQUALS = Color.fromRGBO(173, 125, 65, 0.8);

  final String text;
  final Color color;
  final void Function(String) cb;
// here are the constructors
  Button({
    @required this.text,
    this.color = DEFAULT,
    @required this.cb,
  });
  Button.operation({
    @required this.text,
    this.color = OPERATION,
    @required this.cb,
  });
  Button.equals({
    @required this.text,
    this.color = EQUALS,
    @required this.cb,
  });
  Button.dark({
    @required this.text,
    this.color = DARK,
    @required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: this.color,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () => cb(text),
      ),
    );
  }
}
