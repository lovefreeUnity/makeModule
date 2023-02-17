import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../res/everex_theme.dart';
import '../controller/phone_number_inputfield_controller.dart';

class PhoneNumberTextField extends StatefulWidget {
  PhoneNumberTextField({
    super.key,
    this.isObscure = false,
    this.hintText = '',
    required this.textInputFieldController,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
  bool isObscure;
  String hintText;
  TextInputFieldController textInputFieldController;
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {

  @override
  void initState(){
    super.initState();
    widget.textInputFieldController.setTextFieldController();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
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
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              autofocus: true,
              showCursor: true,
              cursorColor: MORAColor.black,
              keyboardType: TextInputType.phone,
              textAlignVertical: TextAlignVertical.center,
              obscureText: widget.isObscure,
              onChanged:(text) {
                widget.textInputFieldController.onChangePhoneNumber(text);
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11)
              ],
              onEditingComplete: (){
                //입력 완료 시
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                suffixIcon: widget.textInputFieldController.showIcon
                    ? InkWell(
                        onTap: () {

                        },
                        child: const Icon(
                          Icons.circle,
                          size: 19,
                        ),
                      )
                    : null,
                suffixIconColor: MORAColor.gray4,
              ),
            ),
          ],
        ),
    );
  }
}
