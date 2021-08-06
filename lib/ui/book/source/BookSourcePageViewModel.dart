import 'dart:developer';

import 'package:book_store/base/BaseViewModel.dart';
import 'package:book_store/data/entities/BookSource.dart';
import 'package:book_store/db/AppDb.dart';

class BookSourcePageViewModel extends BaseViewModel {
  String? searchKey;
  List<BookSource> sourceList = [];

  upBookSource({String? searchKey, Function? callback}) async {
    List<BookSource>? searchList;
    if (searchKey == null || searchKey.isEmpty) {
      searchList = await AppDb.bookSourceDao.flowAll();
    } else if ("已启用" == searchKey) {

    } else if ("已禁用" == searchKey) {

    } else if (searchKey.startsWith('group:')) {

    } else {

    }
    if (searchList != null) {
      sourceList = searchList;
    }
    callback?.call();
  }
}
