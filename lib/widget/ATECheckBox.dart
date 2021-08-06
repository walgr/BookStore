
import 'package:flutter/material.dart';

class ATECheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String title;

  ATECheckBox({required this.value, required this.title, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(right: 4),
            child: Checkbox(value: this.value, onChanged: this.onChanged),
          ),
          Expanded(child: Text(this.title, style: TextStyle(fontSize: 14, color: Colors.black), maxLines: 1,)
          )
        ],
      ),
    );
  }

}