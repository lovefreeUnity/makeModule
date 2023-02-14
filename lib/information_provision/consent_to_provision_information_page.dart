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
            hospitalName: '연세바른정형외과',
            assignmentDate: '22.10.27 (28일)',
            doctorName: '이현수',
            therapistName: '김민지',
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            color: MORAColor.gray4,
            height: 1,
            width: double.infinity,
          ),
          SizedBox(
            height: 32,
          ),
          InformationProvisionBody(),
          SizedBox(
            height: 65,
          ),
          checkBoxText(),
          SizedBox(
            height: 40,
          ),
          RoundButton(
              text: '확인했어요!',
              borderRadius: 14,
              onClick: () {},
              isEnable: isChecked),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Widget checkBoxText({
    String? text,
    TextStyle? textStyle,
    Color? defaultColor,
    Color? checkColor,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = isChecked ? false : true;
        });
      },
      child: Container(
        padding: EdgeInsets.all(3.5),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isChecked
                        ? checkColor ??
                            checkColor ??
                            MORAColor.primaryColor.shade500
                        : MORAColor.white,
                    border: isChecked
                        ? Border.all(
                            color: checkColor ??
                                checkColor ??
                                MORAColor.primaryColor.shade500,
                          )
                        : Border.all(
                            color: defaultColor ?? MORAColor.gray4,
                          ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: isChecked
                        ? MORAColor.white
                        : defaultColor ?? MORAColor.gray4,
                    size: 17,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  text ?? '위 내용에 동의합니다.',
                  style: textStyle ??
                      moraText.fontSize16.copyWith(
                          color: MORAColor.gray1,
                          fontWeight: FontWeight.w700,
                          height: 1.0),
                ),
              ],
            )),
      ),
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
      } else {}
    },
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      decoration: BoxDecoration(
          color: isEnable
              ? color ?? MORAColor.primaryColor.shade500
              : MORAColor.gray4,
          borderRadius: BorderRadius.circular(borderRadius ?? 16)),
      child: Center(
        child: Text(
          text,
          style: moraText.fontSize18
              .copyWith(color: MORAColor.white, fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}
