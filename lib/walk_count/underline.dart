import 'package:flutter/material.dart';

class UnderLineText extends StatelessWidget {
  String text;
  TextStyle textStyle;
  Color color;
  UnderLineText({
    super.key,
    required this.text,
    required this.textStyle,
    required this.color
  });

  @override
  Widget build(BuildContext context) {

    Size textSize = UnderLine.getTextSize(text: text, textStyle: textStyle);
    double h = MediaQuery.of(context).textScaleFactor;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: textSize.height * h / 2.25,
          width: (textSize.width+10) * h,
          color: color,
        ),
        Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class UnderLine {
  UnderLine._();

  static Size getTextSize(
      {required String text,
      required TextStyle textStyle,
      TextDirection? textDirection,
      int? maxLines}) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: textDirection ?? TextDirection.ltr,
        maxLines: maxLines ?? 1)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
// static TextPosition getTextPosition({required String text,
//   required TextStyle textStyle}){
//   final TextPainter textPainter = TextPainter(
//     text: TextSpan(text: text,style: textStyle),
//   );
//   return TextPosition(offset: textPainter.getPositionForOffset())
// }
}
