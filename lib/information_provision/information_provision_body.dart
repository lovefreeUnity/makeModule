import 'package:flutter/material.dart';

class InformationProvisionBody extends StatelessWidget {
  InformationProvisionBody({Key? key}) : super(key: key);

  Color gray1 = Color(0xFF545454);
  Color gray4 = Color(0xFFDDDDDD);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyTextWidget('건강을 위해', '재활운동을 꾸준히 하면 상태가 좋아질 거예요!'),
        SizedBox(
          height: 32,
        ),
        bodyTextWidget('아플 땐 쉬어가요', '심한 통증이 있는 운동은 멈추고 의료진과 상의해주세요.'),
        SizedBox(
          height: 32,
        ),
        bodyTextWidget('더 나은 서비스 제공을 위해', '여러분의 플랜정보가 담당 의료진에게 공유돼요.'),
        SizedBox(
          height: 8,
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                border: Border.all(color: gray4),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text(
              "개인정보 제3자 제공",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  height: 1.5),
            )),
        Text(
          "1) 제공하는 정보: 운동수행률\n"
          "2) 제공받는 자: 담당 의료진 (상단에 표기된 담당의) \n"
          "3) 제공목적: 환자 관리 및 재활운동 모니터링\n"
          "4) 보유기간: 회원탈퇴 또는 이용자의 삭제요청시까지",
          style: TextStyle(
              fontSize: 14,
              color: Color(0xFF545454),
              fontWeight: FontWeight.w400,
              height: 1.5),
        ),
      ],
    );
  }

  Widget bodyTextWidget(String title, String text,
      {TextStyle? titleStyle, TextStyle? textStyle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF436B6C),
                  height: 1.5),
        ),
        SizedBox(
          height: 8,
        ),
        Text(text,
            style: textStyle ??
                TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.5))
      ],
    );
  }
}
