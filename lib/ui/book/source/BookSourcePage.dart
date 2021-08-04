import 'package:book_store/bean/Menu.dart';
import 'package:book_store/constant/MyColors.dart';
import 'package:book_store/constant/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookSourcePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookSourceState();
  }
}

class _BookSourceState extends State<BookSourcePage> {

  List<Menu> menus = <Menu>[
    Menu('新建书源', icon: MyIcons.import),
    Menu('本地导入', icon: MyIcons.add),
    Menu('网络导入', icon: MyIcons.add),
    Menu('二维码导入', icon: MyIcons.add),
  ];

  void _select(Menu choice) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: MyColors.colorPrimary,
        actions: [
          new PopupMenuButton<Menu>(
            onSelected: _select,
            icon: MyIcons.more,
            itemBuilder: (BuildContext context) {
              return menus
                  .map((e) => PopupMenuItem<Menu>(
                  child: Row(
                    children: [
                      e.icon ?? Container(),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Text(e.title),
                      )
                    ],
                  )))
                  .toList();
            },
          )
        ],
      ),
      body: new Container()
    );
  }
}