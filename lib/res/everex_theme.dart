import 'package:flutter/material.dart';

class MORAColor {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray1 = Color(0xFF545454);
  static const Color gray2 = Color(0xFF747474);
  static const Color gray3 = Color(0xFFAEAEAE);
  static const Color gray4 = Color(0xFFDDDDDD);
  static const Color gray5 = Color(0xFFF2F2F2);
  static const Color gray6 = Color(0xFFF9F9F9);
  static const Color green = Color(0xFF2ECC71);
  static const Color red = Color(0xFFE74C3C);
  static const Color subRed = Color(0xFFFFF1F0);
  static const Color yellow = Color(0xFFF6D860);
  static const Color pink = Color(0xFFEC8F80);

  static const Color chapter1 = Color(0xFFBDDADC);
  static const Color chapter2 = Color(0xFFD3DAEF);
  static const Color chapter3 = Color(0xFFEFE5B8);
  static const Color chapter4 = Color(0xFFECCAC1);
  static const Color chapter5 = Color(0xFFBFD9E4);
  static const Color chapter6 = Color(0xFFCEC5DC);
  static const Color chapter7 = Color(0xFFE4EFE7);
  static const Color chapter8 = Color(0xFFF3D2DA);

  static const Color acheColor0 = Color(0xFFB5D9A4);
  static const Color acheColor1 = Color(0xFFC4E1A6);
  static const Color acheColor2 = Color(0xFFD9ECA9);
  static const Color acheColor3 = Color(0xFFF2F7AD);
  static const Color acheColor4 = Color(0xFFFBF5AC);
  static const Color acheColor5 = Color(0xFFF7E8A7);
  static const Color acheColor6 = Color(0xFFF2DDA5);
  static const Color acheColor7 = Color(0xFFEFD1A0);
  static const Color acheColor8 = Color(0xFFECBD9B);
  static const Color acheColor9 = Color(0xFFEAAC99);
  static const Color acheColor10 = Color(0xFFE89895);
  static const Color mintColor = Color(0xFF83DFDC);
  static const Color mintColorSub = Color(0xFF07BEB8);

  static const MaterialColor primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF0FCFC),
      200: Color(0xFFCDF2F1),
      300: Color(0xFF9CE5E3),
      400: Color(0xFF6AD8D4),
      500: Color(_primaryValue),
      600: Color(0xFF00AFA7),
      700: Color(0xFF009287),
      800: Color(0xFF007266),
      900: Color(0xFF005548),
    },
  );

  static const int _primaryValue = 0xFF07BEB8;

  static const MaterialColor subColor = MaterialColor(
    _subValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFAF8F3),
      200: Color(0xFFFBF6E5),
      300: Color(0xFFFFF0BE),
      400: Color(0xFFF3E5B2),
      500: Color(_subValue),
      600: Color(0xFFE9CD67),
      700: Color(0xFFE8C64F),
      800: Color(0xFFE7B32F),
      900: Color(0xFFDDB219),
    },
  );

  static const int _subValue = 0xFFEBD37E;
}

class MORATextTheme {
  late TextStyle fontSize12;
  late TextStyle fontSize13;
  late TextStyle fontSize14;
  late TextStyle fontSize15;
  late TextStyle fontSize16;
  late TextStyle fontSize17;
  late TextStyle fontSize18;
  late TextStyle fontSize19;
  late TextStyle fontSize20;
  late TextStyle fontSize21;
  late TextStyle fontSize22;
  late TextStyle fontSize23;
  late TextStyle fontSize24;
  late TextStyle fontSize25;
  late TextStyle fontSize26;
  late TextStyle fontSize27;
  late TextStyle fontSize28;
  late TextStyle fontSize32;
  late TextStyle fontSize40;
  late TextStyle fontSize48;

  setTextStyle() {
    fontSize12 = returnTextStyle(12);
    fontSize13 = returnTextStyle(13);
    fontSize14 = returnTextStyle(14);
    fontSize15 = returnTextStyle(15);
    fontSize16 = returnTextStyle(16);
    fontSize17 = returnTextStyle(17);
    fontSize18 = returnTextStyle(18);
    fontSize19 = returnTextStyle(19);
    fontSize20 = returnTextStyle(20);
    fontSize21 = returnTextStyle(21);
    fontSize22 = returnTextStyle(22);
    fontSize23 = returnTextStyle(23);
    fontSize24 = returnTextStyle(24);
    fontSize25 = returnTextStyle(25);
    fontSize26 = returnTextStyle(26);
    fontSize27 = returnTextStyle(27);
    fontSize28 = returnTextStyle(28);
    fontSize32 = returnTextStyle(32);
    fontSize40 = returnTextStyle(40);
    fontSize48 = returnTextStyle(48);
  }

  TextStyle returnTextStyle(double fontSize) {
    return TextStyle(
        color: MORAColor.black,
        fontSize: fontSize,
        height: 1.5,
        fontWeight: FontWeight.w400,
        fontFamily: 'Pretendard');
  }
}

final moraText = MORATextTheme();

InputDecoration cbtTextFiledDecoration() {
  return const InputDecoration(
    filled: false,
    hintStyle: TextStyle(fontSize: 18, color: MORAColor.gray3),
    isDense: true,
    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 8),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: MORAColor.primaryColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: MORAColor.primaryColor),
    ),
    suffixIconConstraints: BoxConstraints(maxHeight: 24),
  );
}
