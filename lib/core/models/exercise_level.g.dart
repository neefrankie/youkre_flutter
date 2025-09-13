// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseLevel _$ExerciseLevelFromJson(Map<String, dynamic> json) =>
    ExerciseLevel(
      id: json['id'] as String,
      courseID: json['course_id'] as String,
      courseSlug: json['course_slug'] as String,
      chapterID: json['chapter_id'] as String,
      chapterSlug: json['chapter_slug'] as String,
      title: json['title'] as String,
      contentVersion: (json['content_version'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$ExerciseLevelToJson(ExerciseLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseID,
      'course_slug': instance.courseSlug,
      'chapter_id': instance.chapterID,
      'chapter_slug': instance.chapterSlug,
      'title': instance.title,
      'content_version': instance.contentVersion,
    };
