import 'package:json_annotation/json_annotation.dart';
part 'ContentRule.g.dart';

@JsonSerializable()
class ContentRule {
  String? content;
  String? nextContentUrl;
  String? webJs;
  String? sourceRegex;
  String? replaceRegex; //替换规则
  String? imageStyle;  //默认大小居中,FULL最大宽度

  ContentRule();

  factory ContentRule.fromJson(Map<String, dynamic> json) =>
      _$ContentRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ContentRuleToJson(this);
}