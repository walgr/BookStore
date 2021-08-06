
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCtx {

  static BuildContext? context;

  static Future<bool> getPrefBoolean(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}