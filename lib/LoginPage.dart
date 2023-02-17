import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grapth/textfeild_controller/textfield_controller.dart';
import 'res/everex_theme.dart';
import 'phone_number/module/phone_number_inputfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
  String bottomSheetText = '인증 문자 받기';
}

class _LoginPageState extends State<LoginPage> {
  final ScrollController _scrollController = ScrollController();
  final TextFieldController _textFieldController = TextFieldController();

  @override
  void initState() {
    _textFieldController.setController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: MORAColor.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Text(
                  '반가워요!\n'
                  '휴대폰 번호를 입력해주세요',
                  style:
                      moraText.fontSize26.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 63),
                child: PhoneNumberTextField(
                  autoFocus: true,
                  hintText: '-없이 숫자만 입력',
                  textFieldLabel: '휴대폰 번호',
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  errorText: null,
                  textFieldController: _textFieldController,
                ),
              ),
            ],
          ),
        ),
        bottomSheet: _textFieldController.disableBottomSheet
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        color: MORAColor.primaryColor,
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: Center(
                          child: Text(
                            widget.bottomSheetText,
                            style: moraText.fontSize18.copyWith(
                                color: MORAColor.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
