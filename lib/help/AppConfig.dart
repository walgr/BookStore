
import 'package:book_store/constant/AppCtx.dart';
import 'package:book_store/constant/PreferKey.dart';

class AppConfig {

  static var isGooglePlay = false;

  static Future<bool> get importKeepName => AppCtx.getPrefBoolean(PreferKey.importKeepName);
}