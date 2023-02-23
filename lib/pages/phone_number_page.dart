import 'package:flutter/material.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '인증번호를 입력해주세요.',
                suffixIcon: Icon(Icons.abc_rounded),
                suffixIconColor: Color(0xFFDDDDDD),
              ),
            ),
            //에러 텍스트
            Text(
              '인증번호를 다시 확인해주세요.',
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFfE74C3C),
                  fontWeight: FontWeight.w400,
                  height: 1.5),
            )
          ],
        ),
      ),
    );
  }
}
