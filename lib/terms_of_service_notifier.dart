import 'package:flutter/cupertino.dart';

class TermsOfServiceNotifier with ChangeNotifier{
  late bool _allAgreement;
  late bool _personalInformationAgreement;
  late bool _termsOfServiceAgreement;

  bool get allAgreement => _allAgreement;
  bool get personalInformationAgreement => _personalInformationAgreement;
  bool get termsOfServiceAgreement => _termsOfServiceAgreement;

  TermsOfServiceNotifier(){
    _allAgreement = false;
    _termsOfServiceAgreement = false;
    _personalInformationAgreement = false;
  }

  allCheckBoxEvent(){
    if(_allAgreement){
      _allAgreement = false;
      _personalInformationAgreement = false;
      _termsOfServiceAgreement = false;
    }else{
      _allAgreement = true;
      _personalInformationAgreement = true;
      _termsOfServiceAgreement = true;
    }
    notifyListeners();
  }

  personalInformationCheckBoxEvent(){
    if(_personalInformationAgreement){
      _allAgreement = false;
      _personalInformationAgreement = false;
    }else{
      _personalInformationAgreement = true;
      if(_termsOfServiceAgreement){
        _allAgreement = true;
      }
    }
    notifyListeners();
  }
  termsOfServiceCheckBoxEvent(){
    if(_termsOfServiceAgreement){
      _allAgreement = false;
      _termsOfServiceAgreement = false;
    }else{
      _termsOfServiceAgreement = true;
      if(_personalInformationAgreement){
        _allAgreement = true;
      }
    }
    notifyListeners();
  }
}