import 'package:flutter/material.dart';

class ATECheckBox extends StatelessWidget {
  final bool value;
  final String title;
  final ValueChanged<bool?>? onChanged;

  //是否自动处理view点击
  final bool dealClick;

  ATECheckBox(
      {required this.value,
      required this.title,
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
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.only(right: 4),
                child: Checkbox(value: this.value, onChanged: this.onChanged),
              ),
              Expanded(
                  child: Text(
                    this.title,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    maxLines: 1,
                  ))
            ],
          ),
        ),
      )
    );
  }
}
