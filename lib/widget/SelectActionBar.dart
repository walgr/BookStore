import 'dart:developer';

import 'package:book_store/constant/MyColors.dart';
import 'package:book_store/constant/MyIcons.dart';
import 'package:book_store/widget/ATECheckBox.dart';
import 'package:book_store/widget/AccentTextView.dart';
import 'package:book_store/widget/DashedDecoration.dart';
import 'package:flutter/material.dart';

class SelectActionBar extends StatefulWidget {
  final int selectCount, allCount;
  final Callback callback;

  SelectActionBar(
      {required this.selectCount,
      required this.allCount,
      required this.callback});

  @override
  State<StatefulWidget> createState() {
    return _SelectActionBarState();
  }
}

class _SelectActionBarState extends State<SelectActionBar> {
  bool selectAll = false;
  String selectAllText = "全选";

  @override
  void initState() {
    super.initState();
  }

  _selectAll() {
    setState(() {
      selectAll = !selectAll;
      widget.callback.selectAll(selectAll);
    });
  }

  void upCountView(int selectCount, int allCount) {
    if (selectCount == 0) {
      selectAll = false;
    } else {
      selectAll = selectCount >= allCount;
    }

    //重置全选的文字
    if (selectAll) {
      selectAllText = "取消全选($selectCount/$allCount)";
    } else {
      selectAllText = "全选($selectCount/$allCount)";
    }
    setMenuClickable(selectCount > 0);
  }

  void setMenuClickable(bool isClickable) {}

  @override
  Widget build(BuildContext context) {
    upCountView(widget.selectCount, widget.allCount);
    return Container(
      padding: EdgeInsets.only(left: 16, top: 6, right: 8, bottom: 6),
      child: Row(
        children: [
          Expanded(
            child: ATECheckBox(
              value: selectAll,
              onChanged: (callback) {
                _selectAll();
              },
              title: selectAllText,
              dealClick: true,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            constraints: BoxConstraints(
              minWidth: 72,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.mdLightDisabled, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(child: AccentTextView('反选')),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            constraints: BoxConstraints(
              minWidth: 72,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.mdLightDisabled, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(child: AccentTextView('删除')),
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

abstract class Callback {
  void selectAll(bool selectAll);

  void revertSelection();

  void onClickMainAction() {}
}
