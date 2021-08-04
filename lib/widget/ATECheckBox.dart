
import 'package:flutter/material.dart';

class ATECheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? _onChanged;
  final String title;

  ATECheckBox(this.value, this.title, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Checkbox(value: this.value, onChanged: this._onChanged),
          Expanded(child: Text(this.title)
          )
        ],
      ),
    );
  }

}