import 'dart:convert';
import 'package:book_store/db/BookSource.dart';

import 'BookSourceAny.dart';

class OldRule {
  static BookSource? jsonToBookSource(String json) {
    BookSource source = BookSource();
    BookSourceAny sourceAny = BookSourceAny.fromJson(jsonDecode(json));
    print(sourceAny.bookSourceUrl);
  }
}