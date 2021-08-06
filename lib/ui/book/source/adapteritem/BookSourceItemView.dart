import 'package:book_store/widget/ATECheckBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookSourceItemView extends StatefulWidget {
  bool checkValue = false;
  final String? title;

  BookSourceItemView(this.checkValue, this.title);

  @override
  State<StatefulWidget> createState() {
    return _BookSourceItemViewState();
  }
}

class _BookSourceItemViewState extends State<BookSourceItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              child: ATECheckBox(
            value: widget.checkValue,
            title: widget.title ?? "",
            onChanged: (callback) {},
          )),
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
