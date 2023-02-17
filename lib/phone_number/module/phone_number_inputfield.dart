import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grapth/textfeild_controller/textfield_controller.dart';
import '../../res/everex_theme.dart';

class PhoneNumberTextField extends StatefulWidget {
  PhoneNumberTextField(
      {super.key,
      this.autoFocus = false,
      this.isObscure = false,
      this.hintText = '',
      required this.textFieldLabel,
      required this.inputFormatters,
      this.errorText,
      required this.textFieldController});

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
  bool autoFocus;
  bool isObscure;
  String textFieldLabel;
  String hintText;
  String? errorText;
  List<TextInputFormatter> inputFormatters;
  TextFieldController textFieldController;
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
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: MORAColor.red)),
          errorStyle: moraText.fontSize12.copyWith(color: MORAColor.red),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: MORAColor.red)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.textFieldLabel,
            style: moraText.fontSize16.copyWith(fontWeight: FontWeight.w500),
          ),
          TextField(
            autofocus: widget.autoFocus,
            showCursor: true,
            cursorColor: MORAColor.black,
            keyboardType: TextInputType.phone,
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.isObscure,
            onChanged: (text) {},
            inputFormatters: widget.inputFormatters,
            onEditingComplete: () {},
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              errorText: widget.errorText,
              suffixIcon: InkWell(
                onTap: widget.textFieldController.clear,
                child: Icon(
                  Icons.arrow_right_alt_outlined,
                  size: 19,
                ),
              ),
              suffixIconColor: MORAColor.gray4,
            ),
            controller: widget.textFieldController,
          ),
        ],
      ),
    );
  }
}
