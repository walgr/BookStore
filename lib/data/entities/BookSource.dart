import 'dart:core';

import 'package:book_store/constant/BookType.dart';
import 'package:book_store/data/entities/rule/BookInfoRule.dart';
import 'package:book_store/data/entities/rule/ContentRule.dart';
import 'package:book_store/data/entities/rule/ExploreRule.dart';
import 'package:book_store/data/entities/rule/SearchRule.dart';
import 'package:book_store/data/entities/rule/TocRule.dart';
import 'package:book_store/db/DbBaseBean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BookSource.g.dart';

@JsonSerializable()
class BookSource extends DbBaseBean {
  String bookSourceName = ""; // 名称
  String? bookSourceGroup; // 分组
  String bookSourceUrl = ""; // 地址，包括 http/https primary key
  int bookSourceType = BookType.defaultType; // 类型，0 文本，1 音频
  String? bookUrlPattern; // 详情页url正则
  int customOrder = 0; // 手动排序编号
  int enabled = 1; // 是否启用
  int enabledExplore = 1; // 启用发现
  int enabledExploreInt = 1;
  String? header; // 请求头
  String? loginUrl; // 登录地址
  String? bookSourceComment; // 注释
  int lastUpdateTime = 0; // 最后更新时间，用于排序
  int weight = 0; // 智能排序的权重
  String? exploreUrl; // 发现url
  ExploreRule? ruleExplore; // 发现规则
  String? searchUrl; // 搜索url
  SearchRule? ruleSearch; // 搜索规则
  BookInfoRule? ruleBookInfo; // 书籍信息页规则
  TocRule? ruleToc; // 目录页规则
  ContentRule? uleContent;

  @override
  DbBaseBean fromJson(Map<String, dynamic> map) {
    return _$BookSourceFromJson(map);
  }

  @override
  String getTableName() {
    return tableName;
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BookSourceToJson(this);
  }

  static var tableName = 'book_sources';

  ///创建表
  static void createTable(Database db) {
    db.execute("CREATE TABLE $tableName "
        "("
        "bookSourceUrl TEXT PRIMARY KEY,"
        " bookSourceName TEXT,"
        " bookSourceGroup TEXT,"
        " bookSourceType INTEGER,"
        " bookUrlPattern TEXT,"
        " customOrder INTEGER,"
        " enabled INTEGER,"
        " enabledExplore INTEGER,"
        " header TEXT,"
        " loginUrl TEXT,"
        " bookSourceComment TEXT,"
        " lastUpdateTime INTEGER,"
        " weight INTEGER,"
        " exploreUrl TEXT,"
        " searchUrl TEXT,"
        " ruleExplore TEXT,"
        " ruleSearch TEXT,"
        " ruleBookInfo TEXT,"
        " ruleToc TEXT,"
        " uleContent TEXT"
        ")");
  }
}
