import 'dart:async';

import 'package:book_store/bean/Menu.dart';
import 'package:book_store/constant/MyColors.dart';
import 'package:book_store/constant/MyIcons.dart';
import 'package:book_store/ui/book/search/SearchPage.dart';
import 'package:book_store/ui/main/bookshelf/adapteritem/BookShelfItemView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class BookShelfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookShelfPageState();
  }
}

class _BookShelfPageState extends State<BookShelfPage> {
  bool isItem = true;
  List<Menu> choices = <Menu>[
    Menu(0, '更新目录', icon: MyIcons.refresh_black_24dp),
    Menu(1, '添加本地', icon: MyIcons.add),
  ];

  void _select(Menu choice) {
    setState(() {
      // Causes the app to rebuild with the new _selectedChoice.
    });
  }

  Future<Null> _onRefresh() {
    return Future.delayed(Duration(seconds: 3), () {
      setState(() {});
    });
  }

  void _onSearchClick() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new SearchPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          brightness: Brightness.dark,
          backgroundColor: MyColors.colorPrimary,
          title: Text(
            '全部',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          actions: [
            new IconButton(onPressed: _onSearchClick, icon: MyIcons.search),
            new PopupMenuButton<Menu>(
              offset: Offset(0,50),
              onSelected: _select,
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) {
                return choices
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
        Expanded(
            child: Container(
                child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    displacement: 20,
                    //指示器显示时距顶部位置
                    color: MyColors.colorPrimary,
                    //指示器颜色，默认ThemeData.accentColor
                    backgroundColor: Colors.white,
                    //指示器背景颜色，默认ThemeData.canvasColor
                    notificationPredicate: defaultScrollNotificationPredicate,
                    child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: isItem
                            ? ListView.builder(
                                itemCount: 20,
                                itemBuilder: (BuildContext context, int index) {
                                  return BookShelfItemView();
                                })
                            : GridView.builder(
                                itemCount: 20,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return BookShelfItemView();
                                })))))
      ],
    );
  }
}
