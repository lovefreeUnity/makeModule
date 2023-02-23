import 'package:flutter/material.dart';

class AuthenticationNumber extends StatefulWidget {
  const AuthenticationNumber({Key? key}) : super(key: key);

  @override
  State<AuthenticationNumber> createState() => _AuthenticationNumberState();
}

class _AuthenticationNumberState extends State<AuthenticationNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            Text(
              '휴대폰 번호',
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pretendard',
                  height: 1.5),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: '-없이 숫자만 입력',
                  suffixIcon: Icon(Icons.abc_rounded),
                  suffixIconColor: Color(0xFFDDDDDD)),
            )
          ],
        ),
      ),
    );
  }
}
