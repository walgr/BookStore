// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookInfoRule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookInfoRule _$BookInfoRuleFromJson(Map<String, dynamic> json) => BookInfoRule()
  ..init = json['init'] as String?
  ..name = json['name'] as String?
  ..author = json['author'] as String?
  ..intro = json['intro'] as String?
  ..kind = json['kind'] as String?
  ..lastChapter = json['lastChapter'] as String?
  ..updateTime = json['updateTime'] as String?
  ..coverUrl = json['coverUrl'] as String?
  ..tocUrl = json['tocUrl'] as String?
  ..wordCount = json['wordCount'] as String?
  ..canReName = json['canReName'] as String?;

Map<String, dynamic> _$BookInfoRuleToJson(BookInfoRule instance) =>
    <String, dynamic>{
      'init': instance.init,
      'name': instance.name,
      'author': instance.author,
      'intro': instance.intro,
      'kind': instance.kind,
      'lastChapter': instance.lastChapter,
      'updateTime': instance.updateTime,
      'coverUrl': instance.coverUrl,
      'tocUrl': instance.tocUrl,
      'wordCount': instance.wordCount,
      'canReName': instance.canReName,
    };
