import 'package:book_store/constant/MyColors.dart';
import 'package:flutter/material.dart';

class Perference extends StatefulWidget {
  final Image image;
  final String title;
  final String? desc;
  final GestureTapCallback? tapCallback;

  Perference(this.image, this.title, {this.desc, this.tapCallback});

  @override
  State<StatefulWidget> createState() {
    return _PerferenceState();
  }
}

class _PerferenceState extends State<Perference> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
      constraints: BoxConstraints(
        minHeight: 60,
      ),
      child: Row(
        children: [
          IntrinsicWidth(
            child: Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.only(top: 1),
              child: widget.image,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.title,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16, color: MyColors.tvTextPrimary)),
                  ),
                  if(widget.desc != null && widget.desc!.isNotEmpty)
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 8),
                    child: Text(widget.desc ?? "",
                        style: TextStyle(
                            fontSize: 14, color: MyColors.tvTextSummary)),
                  ) else Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
