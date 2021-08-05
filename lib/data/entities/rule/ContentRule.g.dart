// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContentRule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentRule _$ContentRuleFromJson(Map<String, dynamic> json) => ContentRule()
  ..content = json['content'] as String?
  ..nextContentUrl = json['nextContentUrl'] as String?
  ..webJs = json['webJs'] as String?
  ..sourceRegex = json['sourceRegex'] as String?
  ..replaceRegex = json['replaceRegex'] as String?
  ..imageStyle = json['imageStyle'] as String?;

Map<String, dynamic> _$ContentRuleToJson(ContentRule instance) =>
    <String, dynamic>{
      'content': instance.content,
      'nextContentUrl': instance.nextContentUrl,
      'webJs': instance.webJs,
      'sourceRegex': instance.sourceRegex,
      'replaceRegex': instance.replaceRegex,
      'imageStyle': instance.imageStyle,
    };
