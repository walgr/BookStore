import 'package:json_annotation/json_annotation.dart';
part 'BookInfoRule.g.dart';

@JsonSerializable()
class BookInfoRule {
  String? init;
  String? name;
  String? author;
  String? intro;
  String? kind;
  String? lastChapter;
  String? updateTime;
  String? coverUrl;
  String? tocUrl;
  String? wordCount;
  String? canReName;
}