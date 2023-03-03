import 'package:flutter/material.dart';

class FullButton extends StatefulWidget {
  const FullButton(
      {Key? key, required this.onTap, this.text = "", this.enable = true})
      : super(key: key);

  final VoidCallback onTap;
  final String text;
  final bool? enable;

  @override
  State<FullButton> createState() => _FullButtonState();
}

class _FullButtonState extends State<FullButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        color: widget.enable! ? Theme.of(context).primaryColor : Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Text(
                widget.text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF),
                    height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
