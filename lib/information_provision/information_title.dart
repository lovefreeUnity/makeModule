import 'package:flutter/material.dart';
import 'package:grapth/res/everex_theme.dart';

class InformationProvisionTitle extends StatelessWidget {
  InformationProvisionTitle({super.key});

  TextStyle titleTextStyle =
  moraText.fontSize24.copyWith(fontWeight: FontWeight.w700);
  TextStyle gray1 = moraText.fontSize14.copyWith(color: MORAColor.gray1);
  TextStyle gray3 = moraText.fontSize14.copyWith(color: MORAColor.gray3);

  String hospitalName = '연세바른정형외과';
  String doctorName = '이현수';
  String therapistName = '김민지';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '홍길동 님의 고관절운동 플랜',
          style: titleTextStyle,
        ),
        Text.rich(
          TextSpan(text: hospitalName, style: gray1, children: [
            WidgetSpan(child: SizedBox(width: 24,)),
            TextSpan(
              text: '배정일',
              style: gray3,
            ),
            WidgetSpan(child: SizedBox(width: 8,)),
            TextSpan(text: '22.10.27 (28일)', style: gray1)
          ]),
        ),
        SizedBox(
          height: 3,
        ),
        Text.rich(TextSpan(
            text: '담담의',
            style: gray3,
            children: [
              WidgetSpan(child: SizedBox(width: 8,)),
              TextSpan(text: doctorName, style: gray1),
              WidgetSpan(child: SizedBox(width: 8,)),
              TextSpan(text: '담당치료사', style: gray3),
              WidgetSpan(child: SizedBox(width: 8,)),
              TextSpan(text: therapistName,style: gray1)
            ])),
        SizedBox(
          height: 3,
        ),
        RichText(text: TextSpan(text: '주의사항',style: gray3,children: [
          WidgetSpan(child: SizedBox(width: 8,)),
          TextSpan(text: '운동 전후 스트레칭을 해주세요.',style: gray1)
        ])),
      ],
    );
  }
}
