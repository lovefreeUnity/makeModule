import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../res/everex_theme.dart';
import '../controller/phone_number_inputfield_controller.dart';

class PhoneNumberTextField extends StatefulWidget {
  PhoneNumberTextField({
    super.key,
    this.isObscure = false,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
  bool isObscure;
  PhoneNumberController phoneNumberController = PhoneNumberController();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  @override
  void initState() async {
    await widget.phoneNumberController.setController();
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
          children: [
            TextField(
              autofocus: true,
              showCursor: true,
              cursorColor: MORAColor.black,
              keyboardType: TextInputType.phone,
              textAlignVertical: TextAlignVertical.center,
              controller: widget.phoneNumberController,
              obscureText: widget.isObscure,
              maxLength: 13,
              maxLengthEnforcement:
                  MaxLengthEnforcement.truncateAfterCompositionEnds,
              // onChanged: widget.phoneNumberController.onChangePhoneNumber,
              decoration: InputDecoration(
                hintText: widget.phoneNumberController.showHint
                    ? widget.phoneNumberController.hintText
                    : '',
                suffixIcon: widget.phoneNumberController.showIcon
                    ? InkWell(
                        onTap: () {
                          widget.phoneNumberController.clear();
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
//MediaQuery.of(context).viewInsets.bottom
