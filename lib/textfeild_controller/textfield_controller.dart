import 'package:flutter/cupertino.dart';

class TextFieldController extends TextEditingController{
  late bool _disableBottomSheet;
  bool get disableBottomSheet => _disableBottomSheet;

  setController(){
    _disableBottomSheet = true;
  }
}