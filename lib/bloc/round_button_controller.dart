import 'dart:async';
import 'package:flutter/cupertino.dart';

class RoundButtonController extends ChangeNotifier{
  late bool _isEnable;
  bool get isEnable => _isEnable;
  RoundButtonController(){
    _isEnable =  false;
  }
  checkEvent(){
    _isEnable = true;
    notifyListeners();
  }
  unCheckEvent(){
   _isEnable = false;
   notifyListeners();
  }
}