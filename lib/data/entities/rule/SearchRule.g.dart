// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchRule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRule _$SearchRuleFromJson(Map<String, dynamic> json) => SearchRule()
  ..author = json['author'] as String?
  ..bookList = json['bookList'] as String?
  ..bookUrl = json['bookUrl'] as String?
  ..coverUrl = json['coverUrl'] as String?
  ..intro = json['intro'] as String?
  ..kind = json['kind'] as String?
  ..lastChapter = json['lastChapter'] as String?
  ..name = json['name'] as String?
  ..updateTime = json['updateTime'] as String?
  ..wordCount = json['wordCount'] as String?;

Map<String, dynamic> _$SearchRuleToJson(SearchRule instance) =>
    <String, dynamic>{
      'author': instance.author,
      'bookList': instance.bookList,
      'bookUrl': instance.bookUrl,
      'coverUrl': instance.coverUrl,
      'intro': instance.intro,
      'kind': instance.kind,
      'lastChapter': instance.lastChapter,
      'name': instance.name,
      'updateTime': instance.updateTime,
      'wordCount': instance.wordCount,
    };
