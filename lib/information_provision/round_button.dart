import 'package:flutter/material.dart';

import '../../../res/everex_theme.dart';

class RoundButton extends StatefulWidget {
  const RoundButton(
      {Key? key,
      this.disabled,
      this.buttonColor,
      this.textColor,
      this.borderRadius,
      required this.text,
      required this.onClick,
      required this.disabledClick})
      : super(key: key);

  final bool? disabled;
  final double? borderRadius;
  final String text;
  final VoidCallback onClick;
  final VoidCallback disabledClick;
  final Color? buttonColor;
  final Color? textColor;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.disabled ?? false) {
          widget.disabledClick();
        } else {
          widget.onClick();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 99),
            color: widget.disabled ?? false
                ? MORAColor.gray4
                : widget.buttonColor ?? MORAColor.primaryColor),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: widget.disabled ?? false
                      ? MORAColor.white
                      : widget.textColor ?? MORAColor.white),
            ),
          ),
        ),
      ),
    );
  }
}
