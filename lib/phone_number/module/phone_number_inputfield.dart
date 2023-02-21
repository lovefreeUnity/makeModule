import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grapth/textfeild_controller/textfield_controller.dart';
import '../../../res/everex_theme.dart';

class PhoneNumberTextField extends StatefulWidget {
  PhoneNumberTextField({
    super.key,
    this.autoFocus = false,
    required this.hintText,
  });

  bool autoFocus;
  String hintText;
  String? errorText; // controller 등으로 상황에 맞게바꿀 수 있게 해야 될 것 같다.

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  NumberTextFieldController textEditController =
      NumberTextFieldController();

  @override
  void dispose() {
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: textFieldTheme,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '휴대폰 번호',
            style: moraText.fontSize16.copyWith(fontWeight: FontWeight.w500),
          ),
          StreamBuilder(
            initialData: '',
            stream: textEditController.inputText,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return TextField(
                controller: textEditController,
                autofocus: widget.autoFocus,
                showCursor: true,
                cursorColor: MORAColor.black,
                keyboardType: TextInputType.phone,
                obscureText: false,
                onChanged: (text) {
                  textEditController.onChanged();
                  textEditController.addListener(() {
                    print("text : ${textEditController.text}");
                  });
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                onEditingComplete: () {},
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: '-없이 숫자만 입력',
                  errorText: null,
                  suffixIcon: snapshot.data!.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            textEditController.removeEvent();
                          },
                          child: Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 19,
                          ),
                        )
                      : null,
                  suffixIconColor: MORAColor.gray4,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

InputDecorationTheme textFieldTheme = InputDecorationTheme(
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
);
