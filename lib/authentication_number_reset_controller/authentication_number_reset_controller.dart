import 'package:flutter/cupertino.dart';

class AuthenticationNumberRestController with ChangeNotifier{
  late int _countTime;
  String get countTime => _countTime.toString();

  late bool _isEnable;
  bool get isEnable => _isEnable;

  AuthenticationNumberRestController(){
    _countTime = 60;
    _isEnable = true;
  }

  Future<void> onClick() async{
    _isEnable = false;
    notifyListeners();
    for(_countTime;_countTime >0;_countTime--){
      Future.delayed(Duration(seconds: 1));
      _countTime -= 1;
      notifyListeners();
    }
  }
}