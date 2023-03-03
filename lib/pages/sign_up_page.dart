import 'package:flutter/material.dart';
import 'package:grapth/component/appbar/custom_app_bar.dart';
import 'package:grapth/component/button/full_button.dart';
import 'package:grapth/component/button/text_field_button.dart';
import 'package:grapth/component/textfiled/always_show_suffix_text_field.dart';
import 'package:grapth/component/textfiled/textfield_head.dart';
import 'package:grapth/validator_builder.dart';

import '../component/button/round_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  String resNumber = "";
  String telAgency = "";
  String telNumber = "";

  bool _nameVisible = false;
  bool _resVisible = false;
  bool _telAgencyVisible = false;
  bool _telNumberVisible = false;

  bool _nameValidate = false;
  bool _resValidate = false;
  bool _telAgencyValidate = false;
  bool _telNumberValidate = false;

  String? _nameError;
  String? _resNumberError;
  String? _telAgencyError;
  String? _telNumberError;

  final telNumberValidate =
      ValidationBuilder(requiredOption: true).phone().build();
  final nameValidate = ValidationBuilder(requiredOption: true).build();
  final resNumberValidate =
      ValidationBuilder(requiredOption: true).resNumber().build();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        setState(() {
          _nameVisible = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: '',
        appbarColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(
                      "반가워요!\n회원가입을 진행할게요",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          height: 1.5),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  //TelNumber
                  AnimatedOpacity(
                    opacity: _telNumberVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: _telNumberVisible
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              const TextFieldHead(
                                  text: "휴대폰 번호",
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w500)),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 4, 16, 4),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 16).copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5),
                                  decoration: const InputDecoration(
                                    hintText: "휴대폰 번호",
                                  ),
                                  onChanged: (str) {},
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  //TelAgency
                  AnimatedOpacity(
                    opacity: _telAgencyVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: _telAgencyVisible
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 12,
                              ),
                              TextFieldHead(
                                  text: "통신사",
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w500)),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                                  child: TextFieldButton(
                                    initText: "통신사 선택",
                                  )),
                            ],
                          )
                        : Container(),
                  ),
                  //ResNumber
                  AnimatedOpacity(
                    opacity: _resVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: _resVisible
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              const TextFieldHead(
                                  text: "주민등록번호",
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.w500)),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 4, 16, 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        maxLength: 6,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(fontSize: 16)
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5),
                                        decoration: const InputDecoration(
                                            hintText: "YYMMDD",
                                            counterText: ""),
                                        onChanged: (str) {},
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: Text("-"),
                                    ),
                                    Expanded(
                                      child: AlwaysShowSuffixTextField(
                                        controller: TextEditingController(),
                                        suffixText: '●●●●●●●',
                                        suffixTextStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  //Name
                  AnimatedOpacity(
                    opacity: _nameVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const TextFieldHead(
                            text: "이름",
                            textStyle: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                fontWeight: FontWeight.w500)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            style: const TextStyle(fontSize: 16).copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                height: 1.5),
                            decoration: const InputDecoration(
                              hintText: "실명 입력",
                            ),
                            onChanged: (str) {
                              setState(() {
                                name = str;
                                _nameError = nameValidate(str);
                                if (_nameError == null) {
                                  _nameValidate = true;
                                } else {
                                  _nameValidate = false;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: RoundButton(
                      disabled: true,
                      text: "맞아요",
                      onClick: () {},
                      disabledClick: () {
                        nextButtonAction();
                        setState(() {});
                      },
                      borderRadius: 16,
                    ),
                  ),
                  //
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: name.isNotEmpty && _resVisible == false
          ? FullButton(
              onTap: () {
                nextButtonAction();
                setState(() {});
              },
              text: "다음",
            )
          : Container(
              height: 1,
            ),
    );
  }

  nextButtonAction() {
    if (_nameVisible &&
        _resVisible == false &&
        _telAgencyVisible == false &&
        _telNumberVisible == false) {
      _resVisible = true;
    } else if (_nameVisible &&
        _resVisible &&
        _telAgencyVisible == false &&
        _telNumberVisible == false) {
      print("주민등록번호");
      _telAgencyVisible = true;
    } else if (_nameVisible &&
        _resVisible &&
        _telAgencyVisible &&
        _telNumberVisible == false) {
      print("통신사");
      _telNumberVisible = true;
    } else if (_nameVisible &&
        _resVisible &&
        _telAgencyVisible &&
        _telNumberVisible) {
      print("전화번호");
      print("끝!");
    }
  }
}
