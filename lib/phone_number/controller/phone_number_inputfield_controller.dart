import 'package:flutter/cupertino.dart';

class PhoneNumberController extends TextEditingController {

  bool showIcon = false;
  bool showHint = false;
  String hintText = '-없이 숫자만 입력';

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
    }else{
      showIcon = false;
    }
  }

  iconClick() {
    showIcon = false;
    showHint = false;
    text = '';
    notifyListeners();
  }
  textFieldClick(){
    showHint = false;
    if(text.length > 12){
      showIcon = true;
    }
    notifyListeners();
  }
  outSideClick(){
    showHint = true;
    showIcon = false;
    notifyListeners();
  }
}
