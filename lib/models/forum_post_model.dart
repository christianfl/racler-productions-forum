import 'package:json_annotation/json_annotation.dart';

part 'forum_post_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ForumPostModel {
  String createdBy;
  DateTime createdAt;
  String text;

  ForumPostModel({
    required this.createdBy,
    required this.createdAt,
    required this.text,
  });

  /// Factory for creating a ForumPostModel from the generated fromJson method
  factory ForumPostModel.fromJson(Map<String, dynamic> json) =>
      _$ForumPostModelFromJson(json);

  /// Connect the generated toJson method
  Map<String, dynamic> toJson() => _$ForumPostModelToJson(this);
}
