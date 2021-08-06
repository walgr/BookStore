
import 'package:book_store/data/entities/BookSource.dart';
import 'package:book_store/db/DbUtils.dart';
import 'package:book_store/help/NetworkUtils.dart';

import 'AppConfig.dart';

class SourceHelp {

  static void insertBookSource(List<BookSource> bookSourceList) {
    bookSourceList.forEach((it) async {
      if (is18Plus(it.bookSourceUrl)) {

      } else {
         await DbUtils.getInstance().insertItem(it);
      }
    });
  }

  static bool is18Plus(String? url) {
    if (url == null) return false;
    var baseUrl = NetworkUtils.getBaseUrl(url);
    if (baseUrl == null) return false;
    if (AppConfig.isGooglePlay) return false;
    try {
      // var host = baseUrl.split('//', '.');
      // var base64Url = EncoderUtils.base64Encode("${host[host.lastIndex - 1]}.${host.last()}")
      // list18Plus.forEach {
      //   if (base64Url == it) {
      //     return true;
      //   }
      // }
    } catch (ignore) {}
    return false;
  }
}