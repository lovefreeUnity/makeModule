import 'package:flutter/material.dart';
import 'package:grapth/bloc/round_button_controller.dart';

class InformationBottom extends StatelessWidget {
  InformationBottom({Key? key}) : super(key: key);

  Color buttonColor = Color(0xFF436B6C);
  Color whiteColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Center(
                child: Text(
                  '확인했어요!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                      height: 1.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
