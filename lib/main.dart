import 'package:bitsdojo_window/bitsdojo_window.dart';
import '/ui/main/BookMainApp.dart';
import 'package:flutter/material.dart';

import 'db/AppDb.dart';

void main() {
  runApp(BookMainApp());
  ///初始化数据库
  AppDb.init();

  doWhenWindowReady(() {
    //iPhone X
    final initialSize = Size(375, 812);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.rect = Rect.fromCenter(center: Offset(0,0), width: initialSize.width/2.0, height: initialSize.height/2.0);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
