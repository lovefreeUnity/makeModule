import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthenticationNumber extends StatefulWidget {
  const AuthenticationNumber({Key? key}) : super(key: key);

  @override
  State<AuthenticationNumber> createState() => _AuthenticationNumberState();
}

class _AuthenticationNumberState extends State<AuthenticationNumber> {
  TextEditingController textEditingController = TextEditingController();
  AuthenticationNumberRestController authenticationNumberRestController = AuthenticationNumberRestController();
  bool showIcon = false;
  bool bottomSheetDisable = true;
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
            Text(
              '010-1234-5678로\n'
              '인증번호를 보내드렸어요',
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  height: 1.5),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('문자를 받지 못 하셨나요?',
                    style: TextStyle(
                        color: Color(0xFF747474),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5)),
                SizedBox(
                  width: 16,
                ),
                AnimatedBuilder(
                  animation: authenticationNumberRestController,
                  builder: (BuildContext context, Widget? child) {
                    return InkWell(
                      onTap: () {
                        if (authenticationNumberRestController._isEnable ==
                            false) {
                          //인증 번호 다시 보내기 클릭 이벤트
                          authenticationNumberRestController.onClick();
                        }
                      },
                      child: Text.rich(
                        TextSpan(
                            text: authenticationNumberRestController.isEnable
                                ? '${authenticationNumberRestController.countTime}초 후 '
                                : '',
                            children: [TextSpan(text: '다시 받기')]),
                        style: TextStyle(
                            color: Color(0xFF6AD8D4),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5),
                      ),
                    );
                  },
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: textEditingController,
              keyboardType: TextInputType.phone,
              onChanged: (text) {
                textEditingController.text.isEmpty
                    ? showIcon = false
                    : showIcon = true;
                if(textEditingController.text.length > 5){//인증 번호 조건에 따라 수정 되어야 할 부분
                  bottomSheetDisable = false;
                }
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: '인증번호를 입력해주세요.',
                suffixIcon: showIcon
                    ? InkWell(
                        onTap: () {
                          textEditingController.clear();
                          showIcon = false;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.abc_rounded,
                          color: Color(0xFFDDDDDD),
                        ),
                      )
                    : null,
                suffixIconColor: Color(0xFFDDDDDD),
              ),
              onTapOutside: (pointerDownEvent) {
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
        onTap: () {
          if(bottomSheetDisable==false){
            Navigator.pushNamed(context, '/TermsOfServicePage'); // 새로운 계정일 시 서비스 이용 약관 화면
            // Navigator.pushNamed(context , '/AlreadySignedUpAccountPage'); // 동일 계정이 이미 있을시 화면
          }
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            color: bottomSheetDisable ? Color(0xFFDDDDDD) : Color(0xFF6AD8D4),
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
            ),),
      ),
    );
  }
}

class AuthenticationNumberRestController with ChangeNotifier {
  late int _countTime;

  String get countTime => _countTime.toString();

  late bool _isEnable;

  bool get isEnable => _isEnable;

  AuthenticationNumberRestController() {
    _countTime = 60;
    _isEnable = false;
  }

  Future<int> _count() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _countTime -= 1;
      if (_countTime == 0) {
        timer.cancel();
        _isEnable = false;
        _countTime = 60;
      }
      notifyListeners();
    });
    return 0;
  }

  Future<void> onClick() async {
    _isEnable = true;
    notifyListeners();
    _count();
  }
}
