import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grapth/res/everex_theme.dart';

void main() {
  moraText.setTextStyle();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '휴대폰 번호',
              style: moraText.fontSize16.copyWith(fontWeight: FontWeight.w500),
            ),
            Theme(
              data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: MORAColor.white,
                  contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: MORAColor.gray4,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: MORAColor.mintColorSub,
                    ),
                  ),
                ),
              ),
              child: TextField(
                autofocus: true,
                showCursor: true,
                keyboardType: TextInputType.phone,
                keyboardAppearance: Brightness.light,
                // controller: TextEditingController(
                //   text: '',
                // ),

                //텍스트 가리기
                // obscureText: true,
                // obscuringCharacter: '*',

                decoration: InputDecoration(
                  suffix :Icon(Icons.circle,size: 12,),
                  hintText: "-없이 숫자만 입력",
                  hintStyle: moraText.fontSize16.copyWith(color: MORAColor.gray3,),
                ),
              ),
            )
            // EditableText(controller: controller, focusNode: focusNode, style: style, cursorColor: cursorColor, backgroundCursorColor: backgroundCursorColor)
          ],
        )),
      )),
    );
  }
}
