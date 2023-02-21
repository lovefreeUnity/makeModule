import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grapth/textfeild_controller/textfield_controller.dart';

import 'res/everex_theme.dart';

class ResidentRegistrationNumber extends StatefulWidget {
  const ResidentRegistrationNumber({Key? key}) : super(key: key);

  @override
  State<ResidentRegistrationNumber> createState() => _ResidentRegistrationNumberState();
}

class _ResidentRegistrationNumberState extends State<ResidentRegistrationNumber> {

  NumberTextFieldController textEditingController =  NumberTextFieldController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Theme(
              data: frontNumberThemeData(),
              child: StreamBuilder(
                initialData: '',
                stream: textEditingController.inputText,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                  return TextField(
                    controller: textEditingController,
                    showCursor: true,
                    cursorColor: MORAColor.black,
                    keyboardType: TextInputType.number,
                    style: moraText.fontSize16.copyWith(color: MORAColor.gray1),
                    onChanged: (text) {
                      textEditingController.onChanged();
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    onEditingComplete: () {},
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: '생년월일',
                      errorText: null,
                      suffixIcon: snapshot.data!.length > 0?
                      InkWell(
                        onTap: (){
                          textEditingController.removeEvent();
                        },
                          child:Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 19,
                            color: Colors.black,
                          )
                      ):null,
                      suffixIconColor: MORAColor.gray4,
                    ),
                  );
                } ,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: Container(
              height: 1,
              width: 7,
              color: MORAColor.gray1,
            ),
          ),
          Expanded(
            child: Theme(
              data: backNumberThemeData(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: MORAColor.white,
                    border: Border.all(
                      color: MORAColor.gray4,
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        style: moraText.fontSize16.copyWith(color: MORAColor.gray1),
                        decoration: InputDecoration(
                            hintText: '0',hintStyle: moraText.fontSize16.copyWith(color: MORAColor.gray3)),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                        child: Text('● ● ● ● ● ●',style: moraText.fontSize16.copyWith(color: false?MORAColor.gray2 : MORAColor.gray3),)
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ThemeData frontNumberThemeData() {
  return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: MORAColor.white,
    hintStyle: moraText.fontSize16.copyWith(
      color: MORAColor.gray3,
    ),
    contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: MORAColor.gray4,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: MORAColor.mintColorSub,
      ),
    ),
    errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: MORAColor.red)),
    errorStyle: moraText.fontSize12.copyWith(color: MORAColor.red),
    focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: MORAColor.red)),
  ));
}

ThemeData backNumberThemeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MORAColor.white,
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8)))),
  );
}
