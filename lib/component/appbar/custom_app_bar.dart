import 'package:flutter/material.dart';

//TODO Create AppBar

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.appbarColor,
      this.backButtonAction,
      this.actionIcons,
      this.titleTextStyle})
      : super(key: key);

  final String title;
  final Color appbarColor;
  final VoidCallback? backButtonAction;
  final List<Widget>? actionIcons;
  final TextStyle? titleTextStyle;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 64);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                if (widget.backButtonAction != null) {
                  widget.backButtonAction!();
                } else {
                  Navigator.maybePop(context);
                }
              })
          : Container(),
      title: Text(
        widget.title,
        style: widget.titleTextStyle ??
            TextStyle(fontSize: 16)
                .copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
      ),
      backgroundColor: widget.appbarColor,
      actions: widget.actionIcons,
      elevation: 0,
      automaticallyImplyLeading: true,
    );
  }
}
