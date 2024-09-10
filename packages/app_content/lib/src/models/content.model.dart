import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content.model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Content extends Equatable {
  final String? title;
  final String content;
  final String value;
  final int? index;
  final int? relationType;

  const Content({
    this.title,
    required this.content,
    required this.value,
    required this.index,
    this.relationType,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);

  @override
  String toString() {
    return value;
  }

  String get data => content;

  @override
  List<Object?> get props => [content, value, index, relationType];
}
