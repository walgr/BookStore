import 'package:book_store/constant/MyIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ImageWidget.dart';

///封面
class CoverImageView extends StatefulWidget {
  //图片地址
  final String url;

  final String? name;
  final String? author;

  CoverImageView(this.url, {this.name, this.author});

  @override
  State<StatefulWidget> createState() {
    return _CoverImageViewState();
  }
}

class _CoverImageViewState extends State<CoverImageView> {
  bool loadFailed = false;

  double viewWidth = 66;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: AspectRatio(
                aspectRatio: 5 / 7,
                child: Container(
                    width: viewWidth,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: ImageWidget(
                            widget.url,
                            FittedBox(
                              fit: BoxFit.fill,
                              child: MyIcons.image_cover_default,
                            ), successListener: (_, __) {
                          loadFailed = false;
                        }, errorListener: (_, __) {
                          setState(() {
                            loadFailed = true;
                          });
                        }))))),
        Visibility(
          visible: loadFailed,
          child: IntrinsicHeight(
            child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                      child: Text(widget.name ?? "",
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 11,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ))),
                  Container(
                      child: Text(widget.author ?? "",
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 7,
                            fontStyle: FontStyle.italic,
                          )))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
