import 'package:book_store/constant/MyIcons.dart';
import 'package:book_store/widget/ATECheckBox.dart';
import 'package:book_store/widget/ATESwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookSourceItemView extends StatefulWidget {
  bool checkValue = false;
  bool switchValue = false;
  final String title;
  final ValueChanged<bool>? onCheckChanged;
  final ValueChanged<bool>? onSwitchChanged;

  BookSourceItemView(
      {required this.checkValue,
      required this.switchValue,
      required this.title,
      this.onCheckChanged,
      this.onSwitchChanged});

  @override
  State<StatefulWidget> createState() {
    return _BookSourceItemViewState();
  }
}

class _BookSourceItemViewState extends State<BookSourceItemView> {
  _onCheckChange() {
    widget.checkValue = !widget.checkValue;
    widget.onCheckChanged?.call(widget.checkValue);
    setState(() {});
  }

  _onSwitchChange() {
    widget.switchValue = !widget.switchValue;
    widget.onSwitchChanged?.call(widget.switchValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
              child: ATECheckBox(
            value: widget.checkValue,
            title: widget.title,
            dealClick: true,
            onChanged: (callback) {
              _onCheckChange();
            },
          )),
          Container(
            margin: EdgeInsets.only(left: 6, right: 6),
            child: ATESwitch(
              value: widget.switchValue,
              onChanged: (callback) {
                _onSwitchChange();
              },
            ),
          ),
          Container(
            width: 36,
            height: 36,
            padding: EdgeInsets.all(6),
            child: MyIcons.source_item_edit,
          ),
          Container(
            width: 36,
            height: 36,
            padding: EdgeInsets.all(6),
            child: MyIcons.more,
          )
        ],
      ),
    );
  }
}
