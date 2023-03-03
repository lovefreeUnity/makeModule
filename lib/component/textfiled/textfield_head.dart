import 'package:flutter/material.dart';

class TextFieldHead extends StatelessWidget {
  const TextFieldHead({
    Key? key,
    required this.text,
    required this.textStyle,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
  }) : super(key: key);

  final String text;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
