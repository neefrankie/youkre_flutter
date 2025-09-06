import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/ui/widgets/choice_option_view.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';

class ExerciseView extends StatelessWidget {
  final Exercise exercise;
  final int? selectedIndex;
  final ValueChanged<int> onClick;

  const ExerciseView({
    super.key,
    required this.exercise,
    this.selectedIndex, required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        MarkdownView(markdown: exercise.prompts),

        const SizedBox(height: 16),

        ...List.generate(
          exercise.multipleChoice.choices.length,
              (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: buildChoiceItem(index),
            );
          },
        ),
      ],
    );
  }

  Widget buildChoiceItem(int index) {
    final choice = exercise.multipleChoice.choices[index];

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: selectedIndex == null ? () => onClick(index) : null,
      child: ChoiceOptionView(
        choice: choice,
        isLatex: exercise.multipleChoice.isLatex,
        correctIndex: exercise.multipleChoice.correctIndex,
        itemIndex: index,
        selectedIndex: selectedIndex,
      ),
    );
  }
}