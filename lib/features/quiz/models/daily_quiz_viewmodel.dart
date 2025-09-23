import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course_kind.dart';
import 'package:youkre_flutter/core/models/daily_exercise_info.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/services/preference_service.dart';
import 'package:youkre_flutter/core/utils/datetime.dart';

class DailyQuizViewModel extends ChangeNotifier {
  final logger = Logger('DailyQuizViewModel');
  bool isLoading = true;
  String? error;
  Exercise? exercise;

  final _prefs = PreferenceService();

  Future<void> getOrFindExercise() async {
    isLoading = true;
    notifyListeners();

    final kind = _prefs.getCourse();
    final dailyExInfo = _prefs.getDailyExerciseInfo();

    // No info.
    if (dailyExInfo == null) {
      logger.info('No daily quiz info');
      await _loadNewDailyExercise(kind);
      return;
    }

    // Does today exists?
    final String currentDate = getCurrentDateAsString();
    if (dailyExInfo.lastDate != currentDate) {
      logger.info('Daily quiz is not today');
      await _loadNewDailyExercise(kind);
      return;
    }

    await _loadTodayExercise(dailyExInfo.exerciseId, kind);
  }

  Future<void> _loadNewDailyExercise(CourseKind kind) async {
    try {
      final exercise = await ExerciseDataSource().findRandomExercise(kind);
      this.exercise = exercise;
      isLoading = false;
      notifyListeners();

      final dailyExInfo = DailyExerciseInfo.today(exerciseId: exercise.id);
      await _prefs.saveDailyExerciseInfo(dailyExInfo);
    } catch (e) {
      error = e.toString();
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadTodayExercise(String id, CourseKind kind) async {
    logger.info('load existing daily quiz');
    try {
      final currentExercise = await ExerciseDataSource().findExerciseById(id);
      exercise = currentExercise;
      isLoading = false;
      notifyListeners();

      if (currentExercise == null) {
        await _loadNewDailyExercise(kind);
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> switchCourse(CourseKind newCourseKind) async {

    final currentKind = _prefs.getCourse();
    if (currentKind == newCourseKind) {
      logger.info('course not changed.');
      return;
    }

    isLoading = true;
    notifyListeners();

    await _loadNewDailyExercise(newCourseKind);
  }
}