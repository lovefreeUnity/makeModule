import 'package:flutter/material.dart';
import 'package:grapth/information_provision/information_provision_body.dart';
import 'package:grapth/information_provision/information_title.dart';
import 'package:grapth/res/everex_theme.dart';

class ConsentToProvisionInformationPage extends StatefulWidget {
  const ConsentToProvisionInformationPage({Key? key}) : super(key: key);

  @override
  State<ConsentToProvisionInformationPage> createState() =>
      _ConsentToProvisionInformationPageState();
}

class _ConsentToProvisionInformationPageState
    extends State<ConsentToProvisionInformationPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InformationProvisionTitle(
            userName: '홍길동',
            hospitalName: '연세바른정형외과',
            assignmentDate: '22.10.27 (28일)',
            doctorName: '이현수',
            therapistName: '김민지',
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
            child: Container(
              color: MORAColor.gray4,
              height: 1,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: InformationProvisionBody(),
          ),
          checkBoxText(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: RoundButton(
                text: '플랜 시작하기',
                borderRadius: 14,
                onClick: () {},
                isEnable: isChecked),
          ),
        ],
      ),
    );
  }

  Widget checkBoxText() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = isChecked ? false : true;
        });
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: isChecked
                        ? MORAColor.primaryColor.shade500
                        : MORAColor.white,
                    border: isChecked
                        ? Border.all(
                            color: MORAColor.primaryColor.shade500,
                          )
                        : Border.all(
                            color:MORAColor.gray4,
                          ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: isChecked
                        ? MORAColor.white
                        : MORAColor.gray4,
                    size: 17,
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '위 내용에 동의합니다.',
                style:moraText.fontSize16.copyWith(
                        color: MORAColor.gray1,
                        fontWeight: FontWeight.w700,
                        height: 1.0),
              ),
            ],
          )),
    );
  }
}

Widget RoundButton({
  required String text,
  required GestureTapCallback onClick,
  double? borderRadius,
  Color? color,
  bool isEnable = true,
}) {
  return InkWell(
    onTap: () {
      if (isEnable) {
        onClick();
      } else {
      }
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: isEnable
              ? color ?? MORAColor.primaryColor.shade500
              : MORAColor.gray4,
          borderRadius: BorderRadius.circular(borderRadius ?? 16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Center(
            child:Text(
              text,
              style:moraText.fontSize18.copyWith(color: MORAColor.white, fontWeight: FontWeight.w700,),
              textAlign: TextAlign.start,
              textHeightBehavior: const TextHeightBehavior(
                leadingDistribution: TextLeadingDistribution.even
              ),
            ),
        ),
      ),
    ),
  );
}
