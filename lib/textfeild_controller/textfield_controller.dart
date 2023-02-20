import 'dart:async';

import 'package:flutter/cupertino.dart';

class TextFieldCounter extends TextEditingController{

  StreamController<int> textController = StreamController();
  Stream<int> get textLength => textController.stream;

}
class BottomSheetController extends ChangeNotifier{
  final StreamController<bool> _bottomController = StreamController();
  Stream<bool> get bottomSheetStream => _bottomController.stream;

  BottomSheetController(){
    _bottomController.sink.add(true);
  }

  onChanged(int textLength){
    if(textLength > 10){
      _bottomController.sink.add(false);
    }else{
      _bottomController.sink.add(true);
    }
  }


  @override
  dispose() {
    _bottomController.close();
    super.dispose();
  }
}