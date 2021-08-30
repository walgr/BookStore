import 'package:flutter/material.dart';

class ATESwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  //是否自动处理view点击
  final bool dealClick;

  ATESwitch(
      {required this.value,
      this.onChanged,
      this.dealClick = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (dealClick) {
            this.onChanged?.call(this.value);
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Switch(value: this.value, onChanged: this.onChanged),
        ));
  }
}
