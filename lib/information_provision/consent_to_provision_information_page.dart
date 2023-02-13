import 'package:flutter/material.dart';
import 'package:grapth/information_provision/information_provision_body.dart';
import 'package:grapth/information_provision/information_title.dart';
import 'package:grapth/res/everex_theme.dart';
import 'package:grapth/test/round_button.dart';

class ConsentToProvisionInformationPage extends StatelessWidget {
  const ConsentToProvisionInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InformationProvisionTitle(),
          const SizedBox(height: 32,),
          Container(color: MORAColor.gray4,height: 1,width: double.infinity,),
          SizedBox(height: 32,),
          InformationProvisionBody(),
          SizedBox(height: 65,),
          RoundButton(text: '확인했어요!',
              borderRadius: 14,
              onClick: (){

          }, disabledClick: (){}),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}
