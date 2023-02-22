import 'package:flutter/material.dart';
import 'package:grapth/information_provision/information_provision_body.dart';
import 'package:grapth/information_provision/information_title.dart';

class ConsentToProvisionInformationPage extends StatefulWidget {
  const ConsentToProvisionInformationPage({Key? key}) : super(key: key);

  @override
  State<ConsentToProvisionInformationPage> createState() =>
      _ConsentToProvisionInformationPageState();
}

class _ConsentToProvisionInformationPageState
    extends State<ConsentToProvisionInformationPage> {
  bool isDisabled = true;
  Color primaryColor = Color(0xFF07BEB8);
  Color gray4 = Color(0xFFDDDDDD);
  Color gray1 = Color(0xFF545454);

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
              color: Color(0xFFDDDDDD),
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
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFDDDDDD),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Center(
                  child: Text(
                    '플랜 시작하기',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget checkBoxText() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDisabled = isDisabled ? false : true;
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
                    color:
                        isDisabled == false ? primaryColor : Color(0xFFFFFFFF),
                    border: isDisabled == false
                        ? Border.all(color: primaryColor)
                        : Border.all(
                            color: gray4,
                          ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: isDisabled == false ? Color(0xFFFFFFFF) : gray4,
                    size: 17,
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '위 내용에 동의합니다.',
                style: TextStyle(
                    color: gray1, fontWeight: FontWeight.w700, height: 1.0),
              ),
            ],
          )),
    );
  }
}
