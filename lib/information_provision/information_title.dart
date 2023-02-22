import 'package:flutter/material.dart';

class InformationProvisionTitle extends StatelessWidget {
  InformationProvisionTitle(
      {super.key,
      required this.userName,
      required this.hospitalName,
      required this.assignmentDate,
      required this.doctorName,
      required this.therapistName});

  TextStyle titleTextStyle = TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xFF000000),height: 1.5);
  TextStyle gray1 = TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Color(0xFF545454),height: 1.5);
  TextStyle gray3 =TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFAEAEAE),height: 1.5,);

  String userName;
  String hospitalName;
  String doctorName;
  String therapistName;
  String assignmentDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$userName 님의 고관절 운동 플랜',
          style: titleTextStyle,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: hospitalName,
              style: gray1,
            ),
            WidgetSpan(
                child: SizedBox(
              width: 24,
            )),
            TextSpan(
              text: '배정일',
              style: gray3,
            ),
            WidgetSpan(
                child: SizedBox(
              width: 8,
            )),
            TextSpan(text: assignmentDate, style: gray1)
          ]),
        ),

        SizedBox(
          height: 3,
        ),

        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '담담의',
              style: gray3,
            ),
            WidgetSpan(
                child: SizedBox(
              width: 8,
            )),
            TextSpan(text: doctorName, style: gray1),
            WidgetSpan(
                child: SizedBox(
              width: 8,
            )),
            TextSpan(text: '담당치료사', style: gray3),
            WidgetSpan(
                child: SizedBox(
              width: 8,
            )),
            TextSpan(text: therapistName, style: gray1)
          ]),
        ),

        SizedBox(
          height: 3,
        ),

        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '주의사항',
              style: gray3,
            ),
            WidgetSpan(
                child: SizedBox(
              width: 8,
            )),
            TextSpan(text: '운동 전후 스트레칭을 해주세요.', style: gray1)
          ]),
        )
      ],
    );
  }
}
