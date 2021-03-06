import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../widget/ATECheckBox.dart';

class SourceImportItemView extends StatefulWidget {
  bool value;
  final String bookSourceName;
  final String bookSourceState;
  final ValueChanged<bool>? onChanged;

  SourceImportItemView(
      {required this.value,
      required this.bookSourceName,
      required this.bookSourceState,
      this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return _SourceImportItemViewState();
  }
}

class _SourceImportItemViewState extends State<SourceImportItemView> {

  _onChanged() {
    setState(() {
      widget.value = !widget.value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: GestureDetector(
      onTap: _onChanged,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
                child: ATECheckBox(
              value: widget.value,
              title: this.widget.bookSourceName,
              onChanged: (check) {
                _onChanged();
              },
            )),
            Container(
              width: 80,
              child: Text(
                widget.bookSourceState,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
