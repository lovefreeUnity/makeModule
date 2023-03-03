import 'package:flutter/material.dart';
import 'package:grapth/component/bottom_sheet/bottom_sheet_body.dart';
import 'package:grapth/component/bottom_sheet/bottom_sheet_header.dart';
import 'package:grapth/component/bottom_sheet/reactive_bottom_sheet.dart';

class TextFieldButton extends StatefulWidget {
  const TextFieldButton({Key? key, required this.initText}) : super(key: key);

  final String initText;
  @override
  State<TextFieldButton> createState() => _TextFieldButtonState();
}

class _TextFieldButtonState extends State<TextFieldButton> {
  bool openBottomSheet = false;
  late String text;

  @override
  void initState() {
    super.initState();
    text = widget.initText;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        openBottomSheet = true;
        setState(() {});
        String? temp = await showModalBottom(
            context,
            ReactiveBottomSheet(
              header: BottomSheetHeader(),
              body: BottomSheetBody(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("SKT"),
                      onTap: () {
                        Navigator.of(context).pop("skt");
                      },
                    ),
                    ListTile(
                      title: Text("KT"),
                      onTap: () {
                        Navigator.of(context).pop("skt");
                      },
                    ),
                    ListTile(
                      title: Text("LG U+"),
                      onTap: () {
                        Navigator.of(context).pop("skt");
                      },
                    ),
                    ListTile(
                      title: Text("SKT 알뜰폰"),
                      onTap: () {
                        Navigator.of(context).pop("skt");
                      },
                    ),
                    ListTile(
                      title: Text("KT 알뜰폰"),
                      onTap: () {
                        Navigator.of(context).pop("skt");
                      },
                    ),
                    ListTile(
                      title: Text("LG U+ 알뜰폰"),
                      onTap: () {
                        Navigator.of(context).pop("skt");
                      },
                    ),
                  ],
                ),
              ),
            ));

        if (temp == null) {
          setState(() {});
          openBottomSheet = false;
        } else {
          text = temp;
          setState(() {});
          openBottomSheet = false;
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: openBottomSheet
                    ? Theme.of(context).primaryColor
                    : Color(0xFFDDDDDD)),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showModalBottom(BuildContext context, Widget widget,
      {bool? touchOutlineClose, bool? dragAble}) async {
    return await showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.4),
        enableDrag: dragAble ?? false,
        isDismissible: touchOutlineClose ?? false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: widget,
          );
        });
  }
}
