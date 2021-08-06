import 'dart:developer';
import 'dart:io';

import 'package:book_store/bean/Menu.dart';
import 'package:book_store/constant/MyColors.dart';
import 'package:book_store/constant/MyIcons.dart';
import 'package:book_store/ui/association/ImportBookSourceDialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AdapterItem/BookSourceItemView.dart';
import 'BookSourcePageViewModel.dart';

class BookSourcePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookSourceState();
  }
}

class _BookSourceState extends State<BookSourcePage> {
  BookSourcePageViewModel viewModel = BookSourcePageViewModel();

  List<Menu> menus = <Menu>[
    Menu(0, '新建书源', icon: MyIcons.import),
    Menu(1, '本地导入', icon: MyIcons.add),
    Menu(2, '网络导入', icon: MyIcons.add),
    Menu(3, '二维码导入', icon: MyIcons.add),
  ];

  void _select(Menu choice) {
    switch (choice.id) {
      case 0:
        _addBookSource();
        break;
      case 1:
        _onImportLocal();
        break;
      case 2:
        _onImportOnLine();
        break;
      case 3:
        _onImportQR();
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await viewModel.upBookSource(callback: () {
      setState(() {});
    });
  }

  ///新建书源
  void _addBookSource() {}

  ///本地导入
  void _onImportLocal() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt', 'json'],
        withReadStream: true,
        withData: true);

    if (result?.files.single.path != null) {
      File file = File(result!.files.single.path!);
      String fileStr = await file.readAsString();
      ImportBookSourceDialog.show(context, ImportBookSourceDialog(fileStr));
    } else {
      // User canceled the picker
    }
  }

  ///网络导入
  void _onImportOnLine() {}

  ///二维码导入
  void _onImportQR() {}

  @override
  Widget build(BuildContext context) {
    return Material(
        child: new Column(
      children: [
        AppBar(
          automaticallyImplyLeading: true,
          brightness: Brightness.dark,
          backgroundColor: MyColors.colorPrimary,
          actions: [
            new PopupMenuButton<Menu>(
              onSelected: _select,
              icon: MyIcons.more,
              itemBuilder: (BuildContext context) {
                return menus
                    .map((e) => PopupMenuItem<Menu>(
                        value: e,
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
                color: Colors.white,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: viewModel.sourceList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            child: BookSourceItemView(false,
                                viewModel.sourceList[index].bookSourceName));
                      }),
                ))),
      ],
    ));
  }
}
