import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../res/everex_theme.dart';

class PhoneNumberTextField extends StatefulWidget {
  PhoneNumberTextField({
    super.key,
    this.autoFocus = false,
    this.isObscure = false,
    this.hintText = '',
    required this.textFieldLabel,
    required this.inputFormatters
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
  bool autoFocus;
  bool isObscure;
  String textFieldLabel;
  String hintText;
  List<TextInputFormatter> inputFormatters;
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {

  @override
  void initState() {
    super.initState();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.textFieldLabel,style: moraText.fontSize16.copyWith(fontWeight: FontWeight.w500),),
          TextField(
            autofocus: widget.autoFocus,
            showCursor: true,
            cursorColor: MORAColor.black,
            keyboardType: TextInputType.phone,
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.isObscure,
            onChanged: (text) {

            },
            inputFormatters: widget.inputFormatters,
            onEditingComplete: () {
            },
            onTapOutside: (event){
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: Icon(
                Icons.arrow_right_alt_outlined,
                size:19,
              ),
              suffixIconColor: MORAColor.gray4,
            ),
          ),
        ],
      ),
    );
  }
}
