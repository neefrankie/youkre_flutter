import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';
import 'package:youkre_flutter/features/exercise/exercise_view.dart';


class ExerciseDetailView extends StatefulWidget {
  final ExerciseLevel level;
  final Exercise exercise;
  final Function(int index, bool isCorrect) onAnswer;

  const ExerciseDetailView({
    super.key,
    required this.level,
    required this.onAnswer,
    required this.exercise,
  });

  @override
  State<ExerciseDetailView> createState() => _ExerciseDetailViewState();
}

class _ExerciseDetailViewState extends State<ExerciseDetailView> {
  // TODO: load exercise progress

  @override
  Widget build(BuildContext context) {
    return ExerciseView(
      exercise: widget.exercise,
      selectedIndex: null, // TODO: sync from exercise progress
      onClick: (index) {
        // TODO: change exercise progress selected index.
        widget.onAnswer(index, true);
      },
    );
  }

}