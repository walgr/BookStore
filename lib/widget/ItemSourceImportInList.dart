
import 'package:flutter/material.dart';

import 'ATECheckBox.dart';

class ItemSourceImportInList extends StatelessWidget {
  
  final String bookSourceName;
  final String bookSourceState;

  ItemSourceImportInList({required this.bookSourceName, required this.bookSourceState});
  
  void _onChanged(bool? checked) {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(child: ATECheckBox(false, bookSourceName, _onChanged)),
          Container(
            width: 80,
            child: Text(bookSourceState),
          )
        ],
      ),
    );
  }

}