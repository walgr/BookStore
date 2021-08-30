import 'package:book_store/base/BaseViewModel.dart';
import 'package:book_store/data/entities/BookSource.dart';
import 'package:book_store/db/AppDb.dart';

class BookSourcePageViewModel extends BaseViewModel {
  String? searchKey;
  List<BookSource> sourceList = [];
  List<BookSource> selectList = [];
  final CallBack callBack;

  BookSourcePageViewModel({required this.callBack});

  Future<void> upBookSource({String? searchKey, Function? callback}) async {
    List<BookSource>? searchList;
    if (searchKey == null || searchKey.isEmpty) {
      searchList = await AppDb.bookSourceDao.flowAll();
    } else if ("已启用" == searchKey) {
    } else if ("已禁用" == searchKey) {
    } else if (searchKey.startsWith('group:')) {
    } else {}
    if (searchList != null) {
      sourceList = searchList;
    }
    callback?.call();
  }

  void onCheckChange(int pos, bool checked) {
    if (checked) {
      selectList.add(sourceList[pos]);
    } else {
      selectList.remove(sourceList[pos]);
    }
    callBack.upCountView();
  }

  void onSwitchChange(int pos, bool select) {
    sourceList[pos].enabled = select ? 1 : 0;
    AppDb.bookSourceDao.update([sourceList[pos]]);
  }

  void onSelectAllChange(bool? selectAll) {
    if (selectAll == true) {
      selectList = sourceList.toList();
    } else {
      selectList = [];
    }
    callBack.upCountView();
  }
}

abstract class CallBack {
  void del(BookSource bookSource);
  void edit(BookSource bookSource);
  void update(List<BookSource> bookSourceList);
  void toTop(BookSource bookSource);
  void toBottom(BookSource bookSource);
  void debug(BookSource bookSource);
  void upOrder();
  void upCountView();
}
