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
      this.textFieldLabel,
      required this.inputFormatters,
      this.errorText,
      this.suffixIcon,
      this.bottomSheetController,
      required this.keyBordType
      });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
  bool autoFocus;
  bool isObscure;
  String? textFieldLabel;
  String hintText;
  String? errorText;
  List<TextInputFormatter> inputFormatters;
  Icon? suffixIcon;
  BottomSheetController? bottomSheetController;
  TextInputType keyBordType;
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {

  TextFieldCounter textEditController = TextFieldCounter();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.bottomSheetController != null) {
      widget.bottomSheetController!.dispose();
    }
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
            widget.textFieldLabel ?? '',
            style: moraText.fontSize16.copyWith(fontWeight: FontWeight.w500),
          ),
          StreamBuilder(
            initialData: '',
            stream: textEditController.inputText,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return TextField(
                controller: textEditController,
                autofocus: widget.autoFocus,
                showCursor: true,
                cursorColor: MORAColor.black,
                keyboardType: widget.keyBordType,
                textAlignVertical: TextAlignVertical.center,
                obscureText: widget.isObscure,
                onChanged: (text) {
                  setState(() {
                    textEditController.onChanged();
                    widget.bottomSheetController!.onChanged(text);
                  });
                },
                inputFormatters: widget.inputFormatters,
                onEditingComplete: () {},
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  errorText: widget.errorText,
                  suffixIcon: snapshot.data != ''
                      ? InkWell(
                          onTap: () {
                            textEditController.removeEvent();
                            widget.bottomSheetController!.removeEvent();
                          },
                          child: widget.suffixIcon)
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
