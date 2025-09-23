import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';

class QuizDetailViewModel extends ChangeNotifier {
  final logger = Logger('QuizDetailViewModel');
  bool isLoading = true;
  String? error;
  ExerciseLevel? level;
  Course? course;
  int? selectedIndex;

  void checkAnswer(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> loadData(Exercise exercise) async {
    isLoading = true;
    notifyListeners();

    try {
      final level = await ExerciseDataSource().findLevelById(exercise.levelId);
      if (level == null) {
        return;
      }
      final course = await ExerciseDataSource().findCourseById(level.courseID);
      this.level = level;
      this.course = course;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}