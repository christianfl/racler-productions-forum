// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumPostModel _$ForumPostModelFromJson(Map<String, dynamic> json) =>
    ForumPostModel(
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      text: json['text'] as String,
    );

Map<String, dynamic> _$ForumPostModelToJson(ForumPostModel instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'text': instance.text,
    };
