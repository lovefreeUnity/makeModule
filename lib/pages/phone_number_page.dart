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
      body: Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.fromLTRB(16, 64, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('반가워요!\n'
                '휴대폰 번호를 입력해주세요',
              style: TextStyle(color: Color(0xFF000000),fontSize: 26,fontWeight: FontWeight.w700,height: 1.5),
            ),
            SizedBox(height: 40,),
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
              onTapOutside: (pointerDownEvent){
                FocusScope.of(context).unfocus();
              },
            )
          ],
        ),
      ),
      bottomSheet: InkWell(
        onTap: (){
          Navigator.pushNamed(context , '/AuthenticationNumber');
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
