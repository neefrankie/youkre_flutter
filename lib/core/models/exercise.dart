import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'multiple_choice.dart';

part 'exercise.g.dart';

// dart run build_runner build
@JsonSerializable()
class Exercise extends Equatable {
  final String id;
  @JsonKey(name: 'level_id')
  final String levelId;
  final String prompts;
  @JsonKey(name: 'multiple_choice')
  final MultipleChoice multipleChoice;
  final String? explanation;

  const Exercise({
    required this.id,
    required this.levelId,
    required this.prompts,
    required this.multipleChoice,
    this.explanation,
  });

  String get fullAnswer {
    if (explanation == null) {
      return prompts;
    }

    return '$prompts\n\n---\n\n$explanation';
  }

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  // Equatable: 使用 id 判断相等性
  @override
  List<Object?> get props => [id];

  // 可选：重写 toString() 方便调试
  @override
  String toString() {
    return 'Exercise(id: $id, levelId: $levelId, prompts: $prompts, explanation: $explanation)';
  }
}