import 'package:flutter/material.dart';

class AlreadySignedUpAccountPage extends StatelessWidget {
  AlreadySignedUpAccountPage({Key? key}) : super(key: key);
  String userid = '홍*동';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SizedBox(height: 64,),),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 48,
              ),
              Expanded(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    '010-1234-5678로\n'
                        '가입한 계정을 찾았어요.',
                    style: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                ),
              ),
              Text(
                '$userid님이 맞으신가요?',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    height: 1.5),
              ),
              SizedBox(height: 88,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                        decoration: BoxDecoration(
                          color: Color(0xFF07BEB8),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            '로그인하기',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 1.5),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      '제 계정이 아니에요',
                      style: TextStyle(
                          color: Color(0xFF545454),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
