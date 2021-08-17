
import 'package:book_store/base/BaseDialogFragment.dart';
import 'package:book_store/constant/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitDialog extends BaseDialogFragment {

  static void show(BuildContext context, BaseDialogFragment dialogFragment) {
    showDialog(context: context, builder: (context) {
      return dialogFragment;
    });
  }

  @override
  State<StatefulWidget> createState() {
    return _WaitDialogState();
  }
}

class _WaitDialogState extends BaseDialogFragmentState<WaitDialog> {

  @override
  Widget buildChild(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
            Container(
              padding: EdgeInsets.all(6),
              child: Text('执行中......', style: TextStyle(fontSize: 14, color: MyColors.tvTextPrimary),),
            )
          ],
        ),
      ),
    );
  }

}