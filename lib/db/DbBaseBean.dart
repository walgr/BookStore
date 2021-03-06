// 基础bean，工具类操作依赖此bean
import 'package:sqflite/sqflite.dart';
export 'package:sqflite/sqflite.dart';

abstract class DbBaseBean {
  /// 实体转换Map
  Map<String, dynamic> toJson();

  /// map转实体
  DbBaseBean fromJson(Map<String, dynamic> map);

  /// 关联表名称
  String getTableName();

  ///创建表
  static void createTable(Database db) {

  }
}