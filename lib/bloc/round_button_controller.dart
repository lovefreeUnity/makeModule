import 'dart:async';
import 'package:flutter/cupertino.dart';

class RoundButtonController extends ChangeNotifier{
  final StreamController<bool> _streamController = StreamController();
  Stream<bool> get isRoundButtonEnable => _streamController.stream;

  checkEvent(){
    _streamController.sink.add(true);
  }
  unCheckEvent(){
    _streamController.sink.add(false);
  }
}