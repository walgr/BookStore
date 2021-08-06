import 'package:book_store/data/entities/rule/BookListRule.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SearchRule.g.dart';

@JsonSerializable()
class SearchRule implements BookListRule {
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

  SearchRule();

  factory SearchRule.fromJson(Map<String, dynamic> json) =>
      _$SearchRuleFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRuleToJson(this);
}