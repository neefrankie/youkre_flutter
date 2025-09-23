import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/features/exercise/exercise_bottom_bar.dart';
import 'package:youkre_flutter/features/exercise/exercise_view.dart';
import 'package:youkre_flutter/features/quiz/models/quiz_detail_viewmodel.dart';

class DailyQuizPage extends StatelessWidget {
  final Exercise exercise;

  const DailyQuizPage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final vm = QuizDetailViewModel();
        vm.loadData(exercise);
        return vm;
      },
      child: Consumer<QuizDetailViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const CircularProgressIndicator();
          }
          if (vm.error != null) {
            return Text('加载失败: ${vm.error}');
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('每日一题'),
            ),
            body: ExerciseView(
              exercise: exercise,
              selectedIndex: vm.selectedIndex,
              onClick: vm.checkAnswer,
            ),
            bottomNavigationBar: ExerciseBottomBar(
                course: vm.course,
                level: vm.level,
                exercise: exercise,
            ),
          );
        }
      ),
    );
  }
}


