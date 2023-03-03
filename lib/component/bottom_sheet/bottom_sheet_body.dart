import 'package:flutter/material.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: child,
      ),
    );
  }
}
