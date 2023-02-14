import 'package:flutter/material.dart';
import 'package:grapth/res/everex_theme.dart';

class InformationProvisionTitle extends StatelessWidget {
  InformationProvisionTitle(
      {super.key,
      required this.userName,
      required this.hospitalName,
      required this.assignmentDate,
      required this.doctorName,
      required this.therapistName});

  TextStyle titleTextStyle =
      moraText.fontSize24.copyWith(fontWeight: FontWeight.w700);
  TextStyle gray1 = moraText.fontSize14.copyWith(color: MORAColor.gray1);
  TextStyle gray3 = moraText.fontSize14.copyWith(color: MORAColor.gray3);

  String userName;
  String hospitalName;
  String doctorName;
  String therapistName;
  String assignmentDate;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$userName 님의 고관절운동 플랜',
            style: titleTextStyle,
          ),
          Text.rich(
            TextSpan(text: hospitalName, style: gray1, children: [
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
            maxLines: 1,
          ),
          SizedBox(
            height: 3,
          ),
          Text.rich(
            TextSpan(text: '담담의', style: gray3, children: [
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
            maxLines: 1,
          ),
          SizedBox(
            height: 3,
          ),
          Text.rich(
            TextSpan(text: '주의사항', style: gray3, children: [
              WidgetSpan(
                  child: SizedBox(
                    width: 8,
                  )),
              TextSpan(text: '운동 전후 스트레칭을 해주세요.', style: gray1)
            ]),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
