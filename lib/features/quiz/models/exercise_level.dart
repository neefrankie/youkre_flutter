// models/exercise_level.dart
import 'package:json_annotation/json_annotation.dart';
import '../../../core/models/chapter_link.dart';
import 'exercise.dart'; // 确保已定义 Exercise

part 'exercise_level.g.dart';

@JsonSerializable()
class ExerciseLevel {
  final String id;
  @JsonKey(name: 'course_id')
  final String courseID;
  @JsonKey(name: 'course_slug')
  final String courseSlug;
  @JsonKey(name: 'chapter_id')
  final String chapterID;
  @JsonKey(name: 'chapter_slug')
  final String chapterSlug;
  final String title;
  final int index;
  @JsonKey(name: 'content_version') // 修复拼写：Versoin → Version
  final int contentVersion;
  final List<Exercise> exercises;

  ExerciseLevel({
    required this.id,
    required this.courseID,
    required this.courseSlug,
    required this.chapterID,
    required this.chapterSlug,
    required this.title,
    required this.index,
    this.contentVersion = 1,
    this.exercises = const [], // 默认空列表
  });

  // 工厂构造函数：从 JSON 创建
  factory ExerciseLevel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLevelFromJson(json);

  // 序列化：对象转 JSON
  Map<String, dynamic> toJson() => _$ExerciseLevelToJson(this);

  // 计算属性：learnMore
  ChapterLink get learnMore => ChapterLink(
    courseSlug: courseSlug,
    chapterSlug: chapterSlug,
  );

  // 实现 ==：基于 id
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ExerciseLevel && other.id == id;
  }

  // 实现 hashCode：基于 id
  @override
  int get hashCode => id.hashCode;

  // 可选：调试用
  @override
  String toString() => 'ExerciseLevel(id: $id, title: $title, index: $index)';
}