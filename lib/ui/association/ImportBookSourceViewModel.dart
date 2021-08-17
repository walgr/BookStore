import 'dart:convert';
import 'dart:developer';

import 'package:book_store/base/BaseViewModel.dart';
import 'package:book_store/data/entities/BookSource.dart';
import 'package:book_store/db/DbUtils.dart';
import 'package:book_store/help/AppConfig.dart';
import 'package:book_store/help/SourceHelp.dart';
import 'package:book_store/help/storage/OldRule.dart';
import 'package:book_store/utils/StringExtensions.dart';
import 'package:json_path/json_path.dart';

class ImportBookSourceViewModel extends BaseViewModel {
  String? groupName;
  List<BookSource> allSources = [];
  List<BookSource?> checkSources = [];
  List<bool> selectStatus = [];

  String tvFooterLeftText = "";

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

  Future<void> importSourceAndCallback(Function() callback) async {
    var keepName = await AppConfig.importKeepName;
    List<BookSource> selectSource = [];
    int index = 0;
    selectStatus.forEach((b) {
      if (b) {
        var source = allSources[index];
        if (keepName) {
          if (checkSources[index] != null) {
            source.bookSourceName = checkSources[index]!.bookSourceName;
            source.bookSourceGroup = checkSources[index]!.bookSourceGroup;
            source.customOrder = checkSources[index]!.customOrder;
          }
        }
        if (groupName != null) {
          source.bookSourceGroup = groupName;
        }
        selectSource.add(source);
      }
      index++;
    });
    SourceHelp.insertBookSource(selectSource);
    // ContentProcessor.upReplaceRules();
    callback.call();
  }

  Future<void> importSource(String text, {Function? callback}) async {
    String mText = text.trim();
    if (mText.isJsonObject()) {
      JsonPath json = JsonPath('\$.sourceUrls');
      Iterable urls = json.readValues(mText);
      if (urls.isNotEmpty == true) {
        urls.forEach((it) {
          importSourceUrl(it);
        });
      } else {
        BookSource? bookStore =
            await OldRule.jsonToBookSource(jsonDecode(mText));
        if (bookStore != null) {
          allSources.add(bookStore);
        }
      }
    } else if (mText.isJsonArray()) {
      List<dynamic> items = jsonDecode(mText);
      for (dynamic item in items) {
        BookSource? bookSource = await OldRule.jsonToBookSource(item);
        if (bookSource != null) {
          allSources.add(bookSource);
        }
      }
    } else if (false) {}
    await comparisonSource();
    callback?.call();
  }

  Future<void> importSourceUrl(String url) async {
    //TODO 网络请求获取数据
  }

  BookSource? getCheckBookSource(int index) {
    if (index >= 0 && index < checkSources.length) return checkSources[index];
    return null;
  }

  Future<void> comparisonSource() async {
    for (var it in allSources) {
      List<BookSource>? sourceList = await DbUtils.getInstance()
          .queryItems(it, key: 'bookSourceUrl', value: it.bookSourceUrl);
      BookSource? source;
      if (sourceList != null && sourceList.isNotEmpty) {
        source = sourceList[0];
      }
      checkSources.add(source);
      selectStatus
          .add(source == null || source.lastUpdateTime < it.lastUpdateTime);
    }
    upSelectText();
  }

  String upSelectText() {
    if (isSelectAll()) {
      tvFooterLeftText = '取消全选(${selectCount()}/${allSources.length})';
    } else {
      tvFooterLeftText = '全选(${selectCount()}/${allSources.length})';
    }
    return tvFooterLeftText;
  }
}
