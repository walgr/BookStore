import 'dart:developer';

import 'package:book_store/base/BaseDialogFragment.dart';
import 'package:book_store/constant/MyColors.dart';
import 'package:book_store/db/BookSource.dart';
import 'package:flutter/material.dart';
import 'package:book_store/widget/ItemSourceImportInList.dart';

import 'ImportBookSourceViewModel.dart';

class ImportBookSourceDialog extends BaseDialogFragment {
  final String source;
  final bool finishOnDismiss;

  ImportBookSourceDialog(this.source, {this.finishOnDismiss = false});

  @override
  State<StatefulWidget> createState() {
    return _ImportBookSourceDialogState();
  }
}

class _ImportBookSourceDialogState extends BaseDialogFragmentState<ImportBookSourceDialog> {
  ImportBookSourceViewModel viewModel = ImportBookSourceViewModel();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await viewModel.importSource(widget.source);
    log('size:${viewModel.allSources.length}');
    setState(() {});
  }

  String _getBookSourceState(BookSource item, BookSource? localSource) {
    if (localSource == null) return '新书源';
    if (item.lastUpdateTime > localSource.lastUpdateTime) return '更新';
    return '已存在';
  }

  void _onTvFooterLeftClick() {
    bool selectAll = viewModel.isSelectAll();
    int index = 0;
    viewModel.selectStatus.forEach((b) {
      if (b != !selectAll) {
        viewModel.selectStatus[index] = !selectAll;
      }
      index++;
    });
    viewModel.upSelectText();
    setState(() {});
  }

  @override
  Widget buildChild(BuildContext context) {
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
                    child: (viewModel.allSources.length == 0)
                        ? Center(
                            child: Container(),
                          )
                        : ListView.builder(
                      itemExtent: 36,
                            itemCount: viewModel.allSources.length,
                            itemBuilder: (context, index) {
                              return ItemSourceImportInList(
                                  value: viewModel.selectStatus[index],
                                  bookSourceName: viewModel
                                      .allSources[index].bookSourceName,
                                  bookSourceState: _getBookSourceState(
                                      viewModel.allSources[index],
                                      viewModel.getCheckBookSource(index)),
                                  onChanged: (checked) {
                                    viewModel.selectStatus[index] = checked;
                                    viewModel.upSelectText();
                                    setState(() {});
                                  });
                            },
                          ))),
            IntrinsicHeight(
              child: Container(
                padding:
                    EdgeInsets.only(left: 32, top: 16, right: 32, bottom: 16),
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      child: Text(
                        viewModel.tvFooterLeftText,
                        style: TextStyle(
                            fontSize: 14, color: MyColors.colorPrimary),
                      ),
                      onTap: _onTvFooterLeftClick,
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: IntrinsicWidth(
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    '取消',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: MyColors.colorPrimary),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 24),
                                  child: Text(
                                    '确定',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: MyColors.colorPrimary),
                                  ),
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
