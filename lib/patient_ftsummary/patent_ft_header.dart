import 'package:flutter/material.dart';

class PatientFtHeader extends StatefulWidget {
  PatientFtHeader(
      {super.key,
      required this.text,
      required this.textStyle,
      this.showLeftButton = true,
      this.showRightButton = true});

  String text;
  TextStyle textStyle;
  bool showLeftButton;
  bool showRightButton;

  @override
  State<PatientFtHeader> createState() => _PatientFtHeaderState();
}

class _PatientFtHeaderState extends State<PatientFtHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          child: SizedBox(
            width: 20,
            height: 20,
            child: widget.showLeftButton ? Icon(Icons.arrow_left) : SizedBox(),
          ),
        ),
        Text(
          widget.text,
          style: widget.textStyle,
        ),
        InkWell(
          child: SizedBox(
            width: 20,
            height: 20,
            child: widget.showLeftButton ? Icon(Icons.arrow_right) : SizedBox(),
          ),
        ),
      ],
    );
  }
}
