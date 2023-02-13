import 'package:flutter/material.dart';
import 'package:grapth/information_provision/information_provision_body.dart';
import 'package:grapth/information_provision/information_title.dart';
import 'package:grapth/res/everex_theme.dart';

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
              onClick: (){}),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}

Widget RoundButton({required String text, required GestureTapCallback onClick,double? borderRadius,Color? color}){
  return InkWell(
    onTap: onClick,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      decoration: BoxDecoration(color: color??MORAColor.primaryColor.shade500,borderRadius:BorderRadius.circular(borderRadius??16)),
      child: Center(child: Text(text,style: moraText.fontSize18.copyWith(color: MORAColor.white,fontWeight: FontWeight.w700),),),
    ),
  );
}