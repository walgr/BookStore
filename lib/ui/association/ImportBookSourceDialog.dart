import 'package:book_store/base/BaseDialogFragment.dart';
import 'package:book_store/db/BookSource.dart';
import 'package:book_store/widget/ItemSourceImportInList.dart';
import 'package:flutter/material.dart';
import 'package:book_store/utils/StringExtensions.dart';

class ImportBookSourceDialog extends BaseDialogFragment {
  final String source;
  final bool finishOnDismiss;

  ImportBookSourceDialog(this.source, {this.finishOnDismiss = false});

  @override
  State<StatefulWidget> createState() {
    return _ImportBookSourceDialogState();
  }
}

class _ImportBookSourceDialogState extends State<ImportBookSourceDialog> {
  List<BookSource> allSources = [];
  List<BookSource> checkSources = [];
  List<bool> selectStatus = [];

  @override
  void initState() {
    super.initState();
  }

  bool isSelectAll() {
    bool isSelectAll = true;
    selectStatus.forEach((it) {
      if (!it) {
        isSelectAll = false;
        return;
      }
    });
    return isSelectAll;
  }

  int selectCount() {
    int count = 0;
    selectStatus.forEach((it) {
      if (it) {
        count++;
      }
    });
    return count;
  }

  void importSource(String text) async {
    String mText = text.trim();
    if (mText.isJsonObject()) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Column(children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Text(
                '导入书源',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Container(
                    color: Colors.white,
                    constraints: BoxConstraints(
                      minHeight: 200,
                    ),
                    child: ListView.builder(
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return ItemSourceImportInList(
                            bookSourceName: '', bookSourceState: '');
                      },
                    ))),
          ]),
        ));
  }
}
