import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/models/course_session.dart';
import 'package:youkre_flutter/core/models/exercise.dart';

class ExerciseViewModel extends ChangeNotifier {

  bool isLoading = true;
  String? error;
  ExerciseProgress? exerciseProgress;

  int? selectedIndex;

  Future<void> loadData({
    required Exercise exercise,
    required CourseSession courseSession,
    required LevelProgress levelProgress,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final db = AppDatabase.instance();
      final progress = await db.exerciseDao.loadOrCreateProgress(
          exercise,
          courseSession: courseSession,
          levelProgress: levelProgress
      );

      exerciseProgress = progress;
      selectedIndex = progress.selectedIndex;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  ExerciseProgress checkAnswer(int selected, Exercise exercise) {
    final progress = exerciseProgress;
    if (progress == null) {
      final newProgress = ExerciseProgress.newSession(exercise.id);
      exerciseProgress = newProgress;
      notifyListeners();
      return ExerciseProgress.newSession(exercise.id);
    }
    if (progress.isCompleted) {
      return progress;
    }
    final newProgress = progress.answered(
        correct: selected == exercise.multipleChoice.correctIndex,
        selectedIndex: selected,
    );
    exerciseProgress = newProgress;
    notifyListeners();
    return newProgress;
  }

  Future<void> updateProgress(ExerciseProgress newProgress) async {
    try {
      final db = AppDatabase.instance();
      await db.exerciseDao.updateProgress(newProgress);
    } catch (e) {
      print(e);
    }
  }
}