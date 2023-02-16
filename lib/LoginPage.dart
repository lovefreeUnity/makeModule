import 'package:flutter/material.dart';

import 'res/everex_theme.dart';
import 'phone_number/module/phone_number_inputfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          color: MORAColor.white,
          child: Column(
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
                child: PhoneNumberTextField(),
              ),
              InkWell(
                child: Container(
                  width: double.infinity,
                  color: MORAColor.primaryColor,
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Center(
                    child: Text(
                      '인증 문자 받기',
                      style: moraText.fontSize18
                          .copyWith(color:MORAColor.white,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
