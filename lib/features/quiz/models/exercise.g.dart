// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
  id: json['id'] as String,
  levelId: json['level_id'] as String,
  prompts: json['prompts'] as String,
  multipleChoice: MultipleChoice.fromJson(
    json['multiple_choice'] as Map<String, dynamic>,
  ),
  explanation: json['explanation'] as String?,
);

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
  'id': instance.id,
  'level_id': instance.levelId,
  'prompts': instance.prompts,
  'multiple_choice': instance.multipleChoice,
  'explanation': instance.explanation,
};
