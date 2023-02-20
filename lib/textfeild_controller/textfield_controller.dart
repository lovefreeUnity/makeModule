import 'dart:async';

import 'package:flutter/cupertino.dart';

class TextFieldCounter extends TextEditingController{

  final StreamController<String> _textController = StreamController();
  Stream<String> get inputText => _textController.stream;

  TextFieldCounter(){
    _textController.sink.add('');
  }
  onChanged(){
    _textController.sink.add(text);
  }
  removeEvent(){
    super.clear();
  }
  @override
  void dispose() {
    _textController.close();
    super.dispose();
  }
}

class BottomSheetController extends ChangeNotifier{
  final StreamController<bool> _bottomController = StreamController();
  Stream<bool> get bottomSheetStream => _bottomController.stream;

  BottomSheetController(){
    _bottomController.sink.add(true);
  }

  onChanged(String text){
    if(text.length > 10){
      _bottomController.sink.add(false);
    }else{
      _bottomController.sink.add(true);
    }
  }

  removeEvent(){
    _bottomController.add(true);
  }

  @override
  dispose() {
    _bottomController.close();
    super.dispose();
  }
}