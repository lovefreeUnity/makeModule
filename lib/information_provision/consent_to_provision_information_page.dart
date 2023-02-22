import 'package:flutter/material.dart';
import 'package:grapth/information_provision/information_bottom.dart';
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
          InformationBottom()
        ],
      ),
    );
  }
}
