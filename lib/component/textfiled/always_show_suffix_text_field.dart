import 'package:flutter/material.dart';

class AlwaysShowSuffixTextField extends StatelessWidget {
  final TextEditingController controller;
  final String suffixText;
  final TextStyle suffixTextStyle;
  final double suffixSpacing;
  final double suffixWidth;

  const AlwaysShowSuffixTextField({
    Key? key,
    required this.controller,
    required this.suffixText,
    required this.suffixTextStyle,
    this.suffixSpacing = 8.0,
    this.suffixWidth = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: suffixWidth,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            maxLength: 1,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: '0', counterText: ""),
          ),
          Positioned(
            right: suffixSpacing,
            child: Text(
              suffixText,
              style: suffixTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
