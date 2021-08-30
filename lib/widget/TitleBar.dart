
import 'package:flutter/cupertino.dart';

class TitleBar extends StatefulWidget implements PreferredSizeWidget {

  final bool automaticallyImplyLeading;
  final Brightness? brightness;
  final double height;

  const TitleBar({Key? key, required this.height, this.automaticallyImplyLeading = false, this.brightness}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TitleBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _TitleBarState extends State<TitleBar> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}