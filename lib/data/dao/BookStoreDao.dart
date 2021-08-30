import 'package:book_store/data/entities/BookSource.dart';
import 'package:book_store/db/DbUtils.dart';

class BookStoreDao {

  ///获取所有书源
  Future<List<BookSource>?> flowAll() async {
    return await DbUtils.getInstance().queryItems(BookSource());
  }

  ///更新书源
  Future<void> update(List<BookSource> bookSourceList) async {
    bookSourceList.forEach((it) async {
      await DbUtils.getInstance().updateItem(it, "bookSourceUrl", it.bookSourceUrl);
    });
  }
}
