import 'dart:async';
import 'package:flutter/cupertino.dart';

class NumberTextFieldController extends TextEditingController{
  final StreamController<String> _textStreamController = StreamController();
  Stream<String> get inputText => _textStreamController.stream;

  //텍스트 mask를 여기 다가 넣어 줘야 하나

  onChanged(){
    _textStreamController.sink.add(text);
  }

  removeEvent(){
    super.clear();
    _textStreamController.sink.add('');
  }

  @override
  void dispose() {
    _textStreamController.close();
    super.dispose();
  }
}