
import 'package:book_store/widget/ATECheckBox.dart';
import 'package:book_store/widget/AccentTextView.dart';
import 'package:flutter/material.dart';

class SelectActionBar extends StatefulWidget {

  bool selectAll = false;

  @override
  State<StatefulWidget> createState() {
    return _SelectActionBarState();
  }
}

class _SelectActionBarState extends State<SelectActionBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 6, right: 8, bottom: 6),
      child: Row(
        children: [
          Expanded(child: ATECheckBox(
            value: widget.selectAll,
            onChanged: null,
            title: '全选',
            dealClick: true,
          ),),
          Container(
            child: AccentTextView(
              '反选'
            ),
          )
        ],
      ),

    );
  }

}