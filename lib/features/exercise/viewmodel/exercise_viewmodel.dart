import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/models/course_session.dart';
import 'package:youkre_flutter/core/models/exercise.dart';

class ExerciseViewModel extends ChangeNotifier {
  final logger = Logger('ExerciseViewModel');

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
    logger.info('loading exercise data ${exercise.id}');

    // Used cached data to avoid query db.
    if (cachedExerciseProgress != null) {
      logger.info('use cached exercise progress');
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
      logger.info('loaded exercise progress ${progress.id}, level ${exercise.levelId}, exercise ${progress.exerciseId}');
      logger.info('exercise selected index: ${progress.selectedIndex}');

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
    logger.info('selected choice $selected for exercise ${exercise.id}');

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
      logger.info('Exercised ${exercise.id} already answered');
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
    logger.info('update exercise progress');
    try {
      final db = AppDatabase.instance();
      await db.exerciseDao.updateProgress(newProgress);
    } catch (e) {
      logger.severe(e);
    }
  }
}