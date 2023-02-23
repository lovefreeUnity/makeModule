import 'package:flutter/cupertino.dart';

class TermsOfServiceNotifier with ChangeNotifier{
  late bool _allAgreement;
  late bool _agreeToPersonalInformation;
  late bool _agreeToTermsOfService;

  bool get allAgreement => _allAgreement;
  bool get agreeToPrivacyPolicy => _agreeToPersonalInformation;
  bool get agreeToTermsOfService => _agreeToTermsOfService;

  TermsOfServiceNotifier(){
    _allAgreement = false;
    _agreeToTermsOfService = false;
    _agreeToPersonalInformation = false;
  }

  allCheckBoxEvent(){
    if(_allAgreement){
      _allAgreement = false;
      _agreeToPersonalInformation = false;
      _agreeToTermsOfService = false;
    }else{
      _allAgreement = true;
      _agreeToPersonalInformation = true;
      _agreeToTermsOfService = true;
    }
    notifyListeners();
  }

  privacyPolicyCheckBoxEvent(){
    if(_agreeToPersonalInformation){
      _allAgreement = false;
      _agreeToPersonalInformation = false;
    }else{
      _agreeToPersonalInformation = true;
      if(_agreeToTermsOfService){
        _allAgreement = true;
      }
    }
    notifyListeners();
  }
  termsOfServiceCheckBoxEvent(){
    if(_agreeToTermsOfService){
      _allAgreement = false;
      _agreeToTermsOfService = false;
    }else{
      _agreeToTermsOfService = true;
      if(_agreeToPersonalInformation){
        _allAgreement = true;
      }
    }
    notifyListeners();
  }
}