import 'package:flutter/material.dart';

class InformationProvisionTitle extends StatelessWidget {
  InformationProvisionTitle(
      {super.key,
      required this.userName,
      required this.hospitalName,
      required this.assignmentDate,
      required this.doctorName,
      required this.therapistName});

  TextStyle titleTextStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF000000),
      height: 1.5);
  TextStyle gray1Color = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFF545454),
      height: 1.5);
  TextStyle gray3Color = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFFAEAEAE),
    height: 1.5,
  );

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
          "$userName님의",
          style: titleTextStyle,
        ),
        Text(
          '장해련님의 MORT-PFPS 프로그램',
          style: titleTextStyle,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: hospitalName,
              style: gray1Color,
            ),
            WidgetSpan(
                child: SizedBox(
              width: 24,
            )),
            TextSpan(
              text: '배정일',
              style: gray3Color,
            ),
            WidgetSpan(
                child: SizedBox(
              width: 8,
            )),
            TextSpan(text: assignmentDate, style: gray1Color)
          ]),
        ),
        SizedBox(
          height: 3,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '담담의',
              style: gray3Color,
            ),
            WidgetSpan(
                child: SizedBox(
              width: 8,
            )),
            TextSpan(text: doctorName, style: gray1Color),
          ]),
        ),
        SizedBox(
          height: 3,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '기간',
              style: gray3Color,
            ),
            WidgetSpan(
                child: SizedBox(
              width: 8,
            )),
            TextSpan(text: '시작일로부터 8주간', style: gray1Color)
          ]),
        )
      ],
    );
  }
}
