import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/models/course_session.dart';
import 'package:youkre_flutter/core/models/exercise.dart';

class ExerciseViewModel extends ChangeNotifier {

  bool isLoading = true;
  String? error;
  ExerciseProgress? exerciseProgress;

  int? get selectedIndex {
    return exerciseProgress?.selectedIndex;
  }

  Future<void> loadData({
    required Exercise exercise,
    required LevelProgress levelProgress,
    required CourseSession courseSession,
    ExerciseProgress? cachedExerciseProgress,
  }) async {
    print('loading exercise data ${exercise.id}');

    // Used cached data to avoid query db.
    if (cachedExerciseProgress != null) {
      print('use cached exercise progress');
      exerciseProgress = cachedExerciseProgress;
      isLoading = false;
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final db = AppDatabase.instance();
      final progress = await db.exerciseDao.loadOrCreateProgress(
          exercise,
          courseSession: courseSession,
          levelProgress: levelProgress
      );
      print('loaded exercise progress ${progress.id}, level ${exercise.levelId}, exercise ${progress.exerciseId}');
      print('exercise selected index: ${progress.selectedIndex}');

      exerciseProgress = progress;
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
    notifyListeners();

    final progress = exerciseProgress;
    // If the data is not created yet. Usually won't happen.
    if (progress == null) {
      final newProgress = ExerciseProgress.newSession(exercise.id);
      exerciseProgress = newProgress;
      notifyListeners();
      return newProgress;
    }
    // Don't allow change
    if (progress.isCompleted) {
      return progress;
    }
    final newProgress = progress.answered(
        correct: selected == exercise.multipleChoice.correctIndex,
        selectedIndex: selected,
    );
    exerciseProgress = newProgress;
    notifyListeners();

    updateProgress(newProgress);

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