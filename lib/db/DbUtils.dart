import 'dart:developer';

import 'package:book_store/data/entities/BookSource.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'DbBaseBean.dart';

/// 数据库存储
class DbUtils {
  DbUtils._() {
    log('打开数据库');
    openDb(databaseName);
  }

  // 数据库路径
  String? databasesPath;

  // 数据库
  Database? database;

  // 数据库版本
  int dbVersion = 1;

  var databaseName = "legado";

  static DbUtils? dbUtils;

  ///在此添加每个数据库表格的创建方法
  static List<Function(Database db)> createTable = [
    BookSource.createTable,
  ];

  static DbUtils getInstance() {
    if (null == dbUtils) dbUtils = DbUtils._();
    return dbUtils!;
  }

  /// 打开数据库
  Future openDb(String dbName) async {
    // 如果数据库路径不存在，赋值
    if (null == databasesPath || databasesPath!.isEmpty)
      databasesPath = await getDatabasesPath();
    // 如果数据库存在，而且数据库没有关闭，先关闭数据库
    closeDb();

    database = await openDatabase(join(databasesPath!, dbName + '.db'),
        version: dbVersion, onCreate: (Database db, int version) async {
      createTable.forEach((element) {
        element.call(db);
      });
    }, onUpgrade: (Database db, int oldVersion, int newVersion) {
      // 版本更新可能牵扯到重新插入表、删除表、表中字段变更-具体更新相关sql语句进行操作

    });
  }

  // 插入数据
  Future<void> insertItem<T extends DbBaseBean>(T t) async {
    if (null == database || !database!.isOpen) return;

    // 插入操作
    await database!.insert(
      t.getTableName(),
      t.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 删除数据
  Future<void> deleteItem<T extends DbBaseBean>(T t,
      {required String key, required String value}) async {
    if (null == database || !database!.isOpen) return null;

    // 删除表
    if (key.isEmpty || value.isEmpty) {
      await database!.delete(t.getTableName());
    } else {
      // 删除数据
      await database!.delete(
        t.getTableName(),
        where: (key + " = ?"),
        whereArgs: [value],
      );
    }
  }

  /// 更新数据
  Future<void> updateItem<T extends DbBaseBean>(
      T t, String key, String value) async {
    if (null == database || !database!.isOpen) return null;

    // 更新数据
    await database!.update(
      t.getTableName(),
      t.toJson(),
      where: (key + " = ?"),
      whereArgs: [value],
    );
  }

  // 查询数据
  Future<List<T>?> queryItems<T extends DbBaseBean>(T t,
      {String key = "", String value = ""}) async {
    if (null == database || !database!.isOpen) return null;

    List<Map<String, dynamic>> maps = List.empty();

    // 列表数据
    if (key.isEmpty || value.isEmpty) {
      maps = await database!.query(t.getTableName());
    } else {
      maps = await database!.query(
        t.getTableName(),
        where: (key + " = ?"),
        whereArgs: [value],
      );
    }

    // map转换为List集合
    return List.generate(maps.length, (i) {
      return t.fromJson(maps[i]) as T;
    });
  }

  /// 关闭数据库
  closeDb() async {
    // 如果数据库存在，而且数据库没有关闭，先关闭数据库
    if (null != database && database!.isOpen) {
      await database!.close();
      database = null;
    }
  }

  /// 删除数据库
  deleteDb(String dbName) async {
    // 如果数据库路径不存在，赋值
    if (null == databasesPath || databasesPath!.isEmpty)
      databasesPath = await getDatabasesPath();

    await deleteDatabase(join(databasesPath!, dbName + '.db'));
  }
}
