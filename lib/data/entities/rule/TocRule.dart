import 'package:json_annotation/json_annotation.dart';
part 'TocRule.g.dart';

@JsonSerializable()
class TocRule {
  String? chapterList;
  String? chapterName;
  String? chapterUrl;
  String? isVip;
  String? updateTime;
  String? nextTocUrl;

  TocRule();

  factory TocRule.fromJson(Map<String, dynamic> json) =>
      _$TocRuleFromJson(json);

  Map<String, dynamic> toJson() => _$TocRuleToJson(this);
}