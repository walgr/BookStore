// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookSourceAny.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSourceAny _$BookSourceAnyFromJson(Map<String, dynamic> json) =>
    BookSourceAny()
      ..bookSourceName = json['bookSourceName'] as String
      ..bookSourceGroup = json['bookSourceGroup'] as String?
      ..bookSourceUrl = json['bookSourceUrl'] as String
      ..bookSourceType = json['bookSourceType'] as int
      ..bookUrlPattern = json['bookUrlPattern'] as String?
      ..customOrder = json['customOrder'] as int
      ..enabled = json['enabled'] as int
      ..enabledExplore = json['enabledExplore'] as int
      ..header = json['header'] as String?
      ..loginUrl = json['loginUrl'] as String?
      ..bookSourceComment = json['bookSourceComment'] as String?
      ..lastUpdateTime = json['lastUpdateTime'] as int
      ..weight = json['weight'] as int
      ..exploreUrl = json['exploreUrl'] as String?
      ..ruleExplore = json['ruleExplore']
      ..searchUrl = json['searchUrl'] as String?
      ..ruleSearch = json['ruleSearch']
      ..ruleBookInfo = json['ruleBookInfo']
      ..ruleToc = json['ruleToc']
      ..uleContent = json['uleContent'];

Map<String, dynamic> _$BookSourceAnyToJson(BookSourceAny instance) =>
    <String, dynamic>{
      'bookSourceName': instance.bookSourceName,
      'bookSourceGroup': instance.bookSourceGroup,
      'bookSourceUrl': instance.bookSourceUrl,
      'bookSourceType': instance.bookSourceType,
      'bookUrlPattern': instance.bookUrlPattern,
      'customOrder': instance.customOrder,
      'enabled': instance.enabled,
      'enabledExplore': instance.enabledExplore,
      'header': instance.header,
      'loginUrl': instance.loginUrl,
      'bookSourceComment': instance.bookSourceComment,
      'lastUpdateTime': instance.lastUpdateTime,
      'weight': instance.weight,
      'exploreUrl': instance.exploreUrl,
      'ruleExplore': instance.ruleExplore,
      'searchUrl': instance.searchUrl,
      'ruleSearch': instance.ruleSearch,
      'ruleBookInfo': instance.ruleBookInfo,
      'ruleToc': instance.ruleToc,
      'uleContent': instance.uleContent,
    };
