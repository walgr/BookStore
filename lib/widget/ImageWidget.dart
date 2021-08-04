import 'package:flutter/material.dart';

/// 封装图片加载控件，增加图片加载失败时加载默认图片
class ImageWidget extends StatefulWidget {
  final String url;
  final double? w;
  final double? h;
  final Widget errorWidget;
  final ImageListener? successListener;
  final ImageErrorListener? errorListener;

  ImageWidget(this.url, this.errorWidget, {this.w, this.h, this.successListener, this.errorListener});

  @override
  State<StatefulWidget> createState() {
    return _StateImageWidget();
  }
}

class _StateImageWidget extends State<ImageWidget> {
  late Image _image;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    _image = Image.network(
      widget.url,
    );
    var resolve = _image.image.resolve(ImageConfiguration.empty);
    resolve.addListener(ImageStreamListener((image, synchronousCall) {
      //加载成功
      if (widget.successListener != null) {
        widget.successListener!(image, synchronousCall);
      }
    }, onError: (dynamic exception, StackTrace? stackTrace) {
      //加载失败
      setState(() {
        isError = true;
        if (widget.errorListener != null) {
          widget.errorListener!(exception, stackTrace);
        }
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return isError ? widget.errorWidget : _image;
  }
}
