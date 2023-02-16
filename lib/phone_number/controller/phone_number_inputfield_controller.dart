import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneNumberController extends TextEditingController{

  late bool showIcon;
  late bool showHint;

  String hintText = '-없이 숫자만 입력';


  Future<void> setController() async {
    showHint = false;
    showIcon = false;
    notifyListeners();
  }

  onChangePhoneNumber() {
    RegExp regExp = RegExp('\\D');
    String phoneNumber = text.replaceAll(regExp, '');
    if (phoneNumber.length > 10) {
      showIcon = true;
      text = phoneNumber.substring(0, 3) +
          '-' +
          phoneNumber.substring(3, 7) +
          '-' +
          phoneNumber.substring(7, 11);
    } else {
      showIcon = false;
    }
  }

  // iconClick() {
  //   _showIcon = false;
  //   _showHint = false;
  //   text = '';
  //   notifyListeners();
  // }
  //
  // textFieldClick() {
  //   _showHint = false;
  //   if (text.length > 12) {
  //     _showIcon = true;
  //   }
  //   notifyListeners();
  // }
  //
  // outSideClick() {
  //   _showHint = true;
  //   _showIcon = false;
  //   notifyListeners();
  // }
}
