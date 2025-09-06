// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleChoice _$MultipleChoiceFromJson(Map<String, dynamic> json) =>
    MultipleChoice(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctIndex: (json['correct_index'] as num).toInt(),
      isLatex: json['is_latex'] as bool? ?? false,
    );

Map<String, dynamic> _$MultipleChoiceToJson(MultipleChoice instance) =>
    <String, dynamic>{
      'choices': instance.choices,
      'correct_index': instance.correctIndex,
      'is_latex': instance.isLatex,
    };
