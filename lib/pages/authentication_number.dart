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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16, 64, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 64,
            ),
            Text('010-1234-5678로\n'
            '인증번호를 보내드렸어요',style: TextStyle(color: Color(0xFF000000),fontSize: 26,fontWeight: FontWeight.w700,height: 1.5),),
            SizedBox(height: 4,),
            Row(
              children: [
                Text('문자를 받지 못 하셨나요?',style: TextStyle(color: Color(0xFF747474),fontSize: 16,fontWeight: FontWeight.w400,height: 1.5)),
                SizedBox(width: 16,),
                Text('60초 후 다시 받기',style: TextStyle(color: Color(0xFF6AD8D4),fontSize: 16,fontWeight: FontWeight.w400,height: 1.5),)
              ],
            ),
            SizedBox(height: 40,),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '인증번호를 입력해주세요.',
                suffixIcon: Icon(Icons.abc_rounded),
                suffixIconColor: Color(0xFFDDDDDD),
              ),
              onTapOutside: (pointerDownEvent){
                FocusScope.of(context).unfocus();
              },
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
      bottomSheet: InkWell(
        onTap: (){
          // Navigator.pushNamed(context , '/TermsOfServicePage');
          Navigator.pushNamed(context , '/AlreadySignedUpAccountPage');
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
            )
        ),
      ),
    );
  }
}
