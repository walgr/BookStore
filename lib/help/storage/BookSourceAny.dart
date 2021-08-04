import 'package:json_annotation/json_annotation.dart';
import 'package:book_store/constant/BookType.dart';
part 'BookSourceAny.g.dart';

@JsonSerializable()
class BookSourceAny {
  String bookSourceName = ""; // 名称
  String? bookSourceGroup; // 分组
  String bookSourceUrl = ""; // 地址，包括 http/https
  int bookSourceType = BookType.defaultType; // 类型，0 文本，1 音频
  String? bookUrlPattern; // 详情页url正则
  int customOrder = 0; // 手动排序编号
  bool enabled = true; // 是否启用
  bool enabledExplore = true; // 启用发现
  String? header; // 请求头
  String? loginUrl; // 登录地址
  String? bookSourceComment; // 注释
  int lastUpdateTime = 0; // 最后更新时间，用于排序
  int weight = 0; // 智能排序的权重
  String? exploreUrl; // 发现url
  Object? ruleExplore; // 发现规则
  String? searchUrl; // 搜索url
  Object? ruleSearch; // 搜索规则
  Object? ruleBookInfo; // 书籍信息页规则
  Object? ruleToc; // 目录页规则
  Object? uleContent; // 正文页规则

  BookSourceAny();

  factory BookSourceAny.fromJson(Map<String, dynamic> json) =>
      _$BookSourceAnyFromJson(json);
}
