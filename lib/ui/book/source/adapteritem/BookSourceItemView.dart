import 'package:book_store/widget/ATECheckBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookSourceItemView extends StatefulWidget {
  bool checkValue = false;
  final String? title;
  final ValueChanged<bool>? onChanged;

  BookSourceItemView(this.checkValue, this.title, {this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return _BookSourceItemViewState();
  }
}

class _BookSourceItemViewState extends State<BookSourceItemView> {
  _onChange() {
    widget.checkValue = !widget.checkValue;
    widget.onChanged?.call(widget.checkValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: ATECheckBox(
              value: widget.checkValue,
              title: widget.title ?? "",
              dealClick: true,
              onChanged: (callback) {
                _onChange();
              },
          )),
          Container(
            margin: EdgeInsets.only(left: 4, right: 4),
            child: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          Container(
            child: Text(
              '',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
