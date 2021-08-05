
import 'package:flutter/material.dart';

abstract class BaseDialogFragment extends StatefulWidget {

}

abstract class BaseDialogFragmentState<T extends StatefulWidget> extends State<T> {

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black12,
        child: buildChild(context)
    );
  }

  Widget buildChild(BuildContext context);
}