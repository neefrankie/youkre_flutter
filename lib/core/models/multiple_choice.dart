import 'package:json_annotation/json_annotation.dart';

part 'multiple_choice.g.dart';

// dart run build_runner build
@JsonSerializable()
class MultipleChoice {
  List<String> choices;
  @JsonKey(name: 'correct_index')
  final int correctIndex;
  @JsonKey(name: 'is_latex')
  final bool isLatex;

  MultipleChoice({
    required this.choices,
    required this.correctIndex,
    this.isLatex = false,
  });

  factory MultipleChoice.fromJson(Map<String, dynamic> json) => _$MultipleChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$MultipleChoiceToJson(this);

  String get correctAnswer {
    if (choices.isEmpty || correctIndex < 0 || correctIndex >= choices.length) {
      return '';
    }

    return choices[correctIndex];
  }
}