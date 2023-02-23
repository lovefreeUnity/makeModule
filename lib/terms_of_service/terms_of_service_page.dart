import 'package:flutter/material.dart';
import 'terms_of_service_notifier.dart';


class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  State<TermsOfServicePage> createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {

  TermsOfServiceNotifier termsOfServiceNotifier = TermsOfServiceNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: AnimatedBuilder(
          animation: termsOfServiceNotifier,
          builder: (BuildContext context, Widget? child) {
            return Column(
              children: [
                SizedBox(height: 64), //appbar 높이
                Text(
                  '서비스 이용약관에 동의해주세요',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000)),
                ),
                SizedBox(
                  height: 48,
                ),
                allCheckBox(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
                  child: Container(
                    color: Color(0xFFDDDDDD),
                    width: double.infinity,
                    height: 1,
                  ),
                ),
                termsOfServiceCheckBox(),
                SizedBox(
                  height: 24,
                ),
                privacyPolicyCheckBox(),
                const SizedBox(
                  height: 22,
                ),
                startButton(),
                const SizedBox(
                  height: 27,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget allCheckBox(){
    return InkWell(
      onTap: () {
        termsOfServiceNotifier.allCheckBoxEvent();
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: termsOfServiceNotifier.allAgreement ? Color(0xFF07BEB8) : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(99)),
              border: Border.all(
                width: 1,
                color: termsOfServiceNotifier.allAgreement ? Colors.white : Color(0xFFDDDDDD),
              ),
            ),
            child: Icon(
              Icons.check,
              size: 19,
              color: termsOfServiceNotifier.allAgreement ? Colors.white : Color(0xFFDDDDDD),
            ),
          ),
          SizedBox(width: 6.5),
          Text(
            '모두 동의',
            style: TextStyle(
                color: Color(0xFF545454),
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 1.5),
          )
        ],
      ),
    );
  }
  Widget termsOfServiceCheckBox(){
    return Column(
      children: [
        InkWell(
          onTap: () {
            termsOfServiceNotifier.termsOfServiceCheckBoxEvent();
          },
          child: Row(
            children: [
              Icon(
                Icons.check,
                color: termsOfServiceNotifier.agreeToTermsOfService ? Color(0xFF07BEB8) : Color(0xFFDDDDDD),
              ),
              Text.rich(
                TextSpan(text: '서비스 이용약관', children: [
                  WidgetSpan(
                      child: SizedBox(
                        width: 4,
                      )),
                  TextSpan(
                    text: '(필수)',
                    style: TextStyle(
                      color: Color(0xFF07BEB8),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ]),
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.5,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              border: Border.all(color: Color(0xFFDDDDDD)),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Text(
                '본 이용약관(이하 “이용약관"은 네이버 제트 주식회사 ZEPETO 앱 및 관련하여 제공하는 프로그램, 소프트웨어 등(이하 서비스" 또는 “ZEPETO” 및 본 이용약관의 적용을 받으며 ZEPETO 앱에서 업로드 및 다운로드, 공유되는 모든 정보 및 텍스트, 그래픽, 사진, 기타 자료(이하 통칭 “콘텐츠")에 대한 접근 및 이용에 관한 사항을 규정합니다. 본 이용약관에 동의하지 않는 경우 ZEPETO를 이용할 수 없습니다.'),
          ),
        ),
      ],
    );
  }
  Widget privacyPolicyCheckBox(){
    return Column(
      children: [
        InkWell(
          onTap: () {
            termsOfServiceNotifier.privacyPolicyCheckBoxEvent();
          },
          child: Row(
            children: [
              Icon(
                Icons.check,
                color: termsOfServiceNotifier.agreeToPrivacyPolicy ? Color(0xFF07BEB8) : Color(0xFFDDDDDD),
              ),
              Text.rich(
                TextSpan(text: '개인정보 수집·이용 동의', children: [
                  WidgetSpan(
                      child: SizedBox(
                        width: 4,
                      )),
                  TextSpan(
                    text: '(필수)',
                    style: TextStyle(
                      color: Color(0xFF07BEB8),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ]),
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.5,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8,),
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              border: Border.all(color: Color(0xFFDDDDDD)),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: double.infinity,
          child: const SingleChildScrollView(
            child: Text(
                '본 이용약관(이하 “이용약관"은 네이버 제트 주식회사 ZEPETO 앱 및 관련하여 제공하는 프로그램, 소프트웨어 등(이하 서비스" 또는 “ZEPETO” 및 본 이용약관의 적용을 받으며 ZEPETO 앱에서 업로드 및 다운로드, 공유되는 모든 정보 및 텍스트, 그래픽, 사진, 기타 자료(이하 통칭 “콘텐츠")에 대한 접근 및 이용에 관한 사항을 규정합니다. 본 이용약관에 동의하지 않는 경우 ZEPETO를 이용할 수 없습니다.'),
          ),
        ),
      ],
    );
  }
  Widget startButton(){
    return InkWell(
      onTap: (){
        if(termsOfServiceNotifier.allAgreement){
          //버튼 클릭 이벤트 추가 해야 됩니다.
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
        decoration: BoxDecoration(
            color: termsOfServiceNotifier.allAgreement ?Color(0xFf07BEB8) : Color(0xFFDDDDDD) ,
            borderRadius: BorderRadius.circular(14)),
        child: const Center(
          child: Text(
            '동의하고 시작',
            style:
            TextStyle(color: Colors.white,fontWeight: FontWeight.w700 ,fontSize: 18, height: 1.5),
          ),
        ),
      ),
    );
  }
}
