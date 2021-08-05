// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TocRule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TocRule _$TocRuleFromJson(Map<String, dynamic> json) => TocRule()
  ..chapterList = json['chapterList'] as String?
  ..chapterName = json['chapterName'] as String?
  ..chapterUrl = json['chapterUrl'] as String?
  ..isVip = json['isVip'] as String?
  ..updateTime = json['updateTime'] as String?
  ..nextTocUrl = json['nextTocUrl'] as String?;

Map<String, dynamic> _$TocRuleToJson(TocRule instance) => <String, dynamic>{
      'chapterList': instance.chapterList,
      'chapterName': instance.chapterName,
      'chapterUrl': instance.chapterUrl,
      'isVip': instance.isVip,
      'updateTime': instance.updateTime,
      'nextTocUrl': instance.nextTocUrl,
    };
