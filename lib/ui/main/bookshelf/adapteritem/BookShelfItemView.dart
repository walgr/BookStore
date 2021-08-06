import 'package:book_store/constant/MyColors.dart';
import 'package:book_store/constant/MyIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../widget/CoverImageView.dart';

class BookShelfItemView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BookShelfItemViewState();
  }
}

class _BookShelfItemViewState extends State<BookShelfItemView> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child:
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, bottom: 12),
              child: CoverImageView("")
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 12, bottom: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 2, bottom: 4),
                        child: Text("书名", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1),
                      ),
                      Container(
                        child: Row(children: [
                          Opacity(opacity: 0x8A/0xFF, child: MyIcons.author),
                          Text("作者", style: TextStyle(fontSize: 13, color: MyColors.tvTextSummary), maxLines: 1),
                        ],),
                      ),
                      Container(
                        child: Row(children: [
                          Opacity(opacity: 0x8A/0xFF, child: MyIcons.history),
                          Text("最近", style: TextStyle(fontSize: 13, color: MyColors.tvTextSummary), maxLines: 1),
                        ],),
                      ),
                      Container(
                        child: Row(children: [
                          Opacity(opacity: 0x8A/0xFF, child: MyIcons.book_last),
                          Text("最新", style: TextStyle(fontSize: 13,  color: MyColors.tvTextSummary), maxLines: 1),
                        ],),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}
