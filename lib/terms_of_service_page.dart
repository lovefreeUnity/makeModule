import 'package:flutter/material.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('서비스 이용약관에 동의해주세요',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700,color: Color(0xFF000000)),),
          SizedBox(height: 48,),
        ],
      ),
    );
  }
}
