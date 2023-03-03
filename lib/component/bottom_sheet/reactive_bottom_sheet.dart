// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ReactiveBottomSheet extends StatefulWidget {
  const ReactiveBottomSheet({
    Key? key,
    required this.header,
    required this.body,
  }) : super(key: key);

  final Widget header;
  final Widget body;

  @override
  _ReactiveBottomSheetState createState() => _ReactiveBottomSheetState();
}

class _ReactiveBottomSheetState extends State<ReactiveBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 84,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.header,
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: maxHeight - 150,
                          maxWidth: double.infinity,
                        ),
                        child: SingleChildScrollView(child: widget.body)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
