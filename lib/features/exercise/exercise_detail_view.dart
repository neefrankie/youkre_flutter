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
  final bool isLast;
  final GestureTapCallback onSummary;
  final ValueChanged<ExerciseProgress> onAnswer;

  const ExerciseDetailView({
    super.key,
    required this.exercise,
    required this.levelProgress,
    required this.courseSession,
    required this.isLast,
    required this.onAnswer,
    required this.onSummary,
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
      child: Builder(
        builder: (context) {
          return Consumer<ExerciseViewModel>(
              builder: (context, vm, child) {
                return ExerciseView(
                  exercise: exercise,
                  selectedIndex: vm.selectedIndex,
                  onClick: (selectedIndex) {
                    onCheckAnswer(context, selectedIndex);
                  },
                  extra: (isLast && vm.selectedIndex != null) ? finishButton() : null,
                );
              }
          );
        }
      ),
    );
  }

  Widget finishButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: onSummary,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          '完成',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void onCheckAnswer(BuildContext context, int selectedIndex) {
    final vm = context.watch<ExerciseViewModel>();
    final newProgress = vm.checkAnswer(selectedIndex, exercise);
    onAnswer(newProgress);
    vm.updateProgress(newProgress);
  }
}