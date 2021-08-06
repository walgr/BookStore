import 'package:book_store/data/entities/rule/BookListRule.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ExploreRule.g.dart';

@JsonSerializable()
class ExploreRule implements BookListRule {
  @override
  String? author;

  @override
  String? bookList;

  @override
  String? bookUrl;

  @override
  String? coverUrl;

  @override
  String? intro;

  @override
  String? kind;

  @override
  String? lastChapter;

  @override
  String? name;

  @override
  String? updateTime;

  @override
  String? wordCount;

  ExploreRule();

  factory ExploreRule.fromJson(Map<String, dynamic> json) =>
      _$ExploreRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ExploreRuleToJson(this);
}