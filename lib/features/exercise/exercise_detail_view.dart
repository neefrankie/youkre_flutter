import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/features/exercise/exercise_view.dart';

import 'package:youkre_flutter/core/models/course_session.dart';
import 'package:youkre_flutter/features/exercise/viewmodel/exercise_viewmodel.dart';


class ExerciseDetailView extends StatelessWidget {
  final Exercise exercise;
  final LevelProgress levelProgress;
  final CourseSession courseSession;
  final ValueChanged<ExerciseProgress> onAnswer;

  const ExerciseDetailView({
    super.key,
    required this.exercise,
    required this.levelProgress,
    required this.courseSession,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = ExerciseViewModel();
        vm.loadData(
            exercise: exercise,
            courseSession: courseSession,
            levelProgress: levelProgress
        );
        return vm;
      },
      child: Consumer<ExerciseViewModel>(
          builder: (context, vm, child) {
            return ExerciseView(
              exercise: exercise,
              selectedIndex: vm.selectedIndex,
              onClick: (selectedIndex) {
                final newProgress = vm.checkAnswer(selectedIndex, exercise);
                onAnswer(newProgress);
                vm.updateProgress(newProgress);
              },
            );
          }
      ),
    );
  }
}