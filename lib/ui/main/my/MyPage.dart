import 'package:book_store/constant/MyColors.dart';
import 'package:book_store/constant/MyIcons.dart';
import 'package:book_store/ui/book/source/BookSourcePage.dart';
import 'package:book_store/widget/Preference.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  late List<Widget> perference;

  @override
  void initState() {
    super.initState();
    perference = [];
    perference.add(
      AppBar(
        brightness: Brightness.dark,
        backgroundColor: MyColors.colorPrimary,
        title: Text(
          '我的',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          new IconButton(onPressed: null, icon: MyIcons.help),
        ],
      ),
    );
    perference.addAll([
      Perference(MyIcons.cfg_source, "书源管理",
          desc: "新建/导入/编辑/管理书源", tapCallback: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new BookSourcePage()),);
          }),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: perference
          .map((e) => (e is Perference)
              ? GestureDetector(
                  onTap: e.tapCallback,
                  child: Container(
                    color: Colors.transparent,
                      child: e),
                )
              : e)
          .toList(),
    );
  }
}
