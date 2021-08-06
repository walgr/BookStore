import 'package:book_store/data/entities/BookSource.dart';
import 'package:book_store/db/DbUtils.dart';

class BookStoreDao {

  Future<List<BookSource>?> flowAll() async {
    return await DbUtils.getInstance().queryItems(BookSource());
  }
}
