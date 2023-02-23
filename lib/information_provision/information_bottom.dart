import 'package:flutter/material.dart';
import 'package:grapth/bloc/round_button_controller.dart';

class InformationBottom extends StatelessWidget {
  InformationBottom({Key? key}) : super(key: key);

  Color primaryColor = Color(0xFF07BEB8);
  Color gray4 = Color(0xFFDDDDDD);
  Color gray1 = Color(0xFF545454);
  RoundButtonController roundButtonController = RoundButtonController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: roundButtonController,
      builder: (context,  child) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                roundButtonController.isEnable
                    ? roundButtonController.unCheckEvent()
                    : roundButtonController.checkEvent();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: roundButtonController.isEnable ? primaryColor : Color(0xFFFFFFFF),
                        border: roundButtonController.isEnable
                            ? Border.all(color: primaryColor)
                            : Border.all(
                                color: gray4,
                              ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: roundButtonController.isEnable ? Color(0xFFFFFFFF) : gray4,
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
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: roundButtonController.isEnable ? primaryColor : gray4,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Center(
                    child: Text(
                      '플랜 시작하기',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        height: 1.5
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
