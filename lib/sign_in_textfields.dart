import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  //아이콘on off 및 텍스트 받아오기 위한 텍스트 컨트롤러
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController socialSecurityFrontNumberTextController = TextEditingController();
  TextEditingController socialSecurityBackNumberTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        color: Color(0xFFFFFFFF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              //비밀 번호
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('비밀번호',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Pretendard',
                          height: 1.5)),
                  TextField(
                    controller: passwordTextController,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        hintText: '영문, 숫자, 특수문자의 조합 (8-16자)',
                        suffixIcon: passwordTextController.text.isNotEmpty
                            ? InkWell(
                                onTap: () {
                                  passwordTextController.clear();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFFDDDDDD),
                                ),
                              )
                            : null),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //주민등록번호
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('주민등록번호',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Pretendard',
                          height: 1.5)),
                  Row(
                    children: [
                      Expanded(
                        //주민 번호 앞자리
                        child: TextField(
                          controller: socialSecurityFrontNumberTextController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: '생년월일',
                              suffixIcon: socialSecurityFrontNumberTextController.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () {
                                        socialSecurityFrontNumberTextController.clear();
                                        setState(() {});
                                      },
                                      child: Icon(Icons.abc_rounded))
                                  : null,
                              suffixIconColor: Color(0xFFDDDDDD)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          width: 7,
                          height: 1,
                          color: Color(0xFF545454),
                        ),
                      ),
                      //주민 번호 뒷자리
                      Expanded(
                        child: TextField(
                          controller: socialSecurityBackNumberTextController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: '0',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              //이름 입력란
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '이름',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Pretendard',
                        height: 1.5),
                  ),
                  TextField(
                    controller: nameTextController,
                    keyboardType: TextInputType.name,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: '실명 입력',
                      suffixIcon: nameTextController.text.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                nameTextController.clear();
                                setState(() {});
                              },
                              child: Icon(Icons.abc_rounded),
                            )
                          : null,
                      suffixIconColor: Color(0xFFDDDDDD),
                    ),
                  ),
                  //주의 사항
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        size: 14,
                        color: Color(0xFF07BEB8),
                      ),
                      Text(
                        '잘못 입력한 경우 운동 배정이 되지 않으니 주의해주세요.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF07BEB8),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Pretendard',
                            height: 1.5),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/TextFieldPage/TermsOfServicePage');
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            color: Color(0xFFDDDDDD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "다음",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      height: 1.5),
                ),
              ],
            )),
      ),
    );
  }
}