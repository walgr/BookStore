
import 'package:book_store/data/dao/BookStoreDao.dart';
import 'package:book_store/db/DbUtils.dart';

class AppDb {

  static init() {
    DbUtils.getInstance();
  }

  static BookStoreDao bookSourceDao = BookStoreDao();
}