import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart';

part 'course_session.freezed.dart';

@freezed
abstract class CourseSession with _$CourseSession {
  const CourseSession._();

  const factory CourseSession({
    required String id,
    required String courseId,
    required DateTime startedAt,
    DateTime? completedAt,
    int? lastLevelIndex,
  }) = _CourseSession;

  factory CourseSession.newSession(String courseId) {
    return CourseSession(
      id: const Uuid().v4(),
      courseId: courseId,
      startedAt: DateTime.now(),
      completedAt: null,
      lastLevelIndex: null,
    );
  }

  bool get isCompleted => completedAt != null;

  CourseSession markComplete() {
    return copyWith(
      completedAt: DateTime.now(),
    );
  }

  CourseSession advanceLevel(int maxIndex) {
    var current = lastLevelIndex;
    if (current == null) {
      if (maxIndex >= 0) {
        current = 0;
      }
    } else {
      if (current < maxIndex) {
        current = current + 1;
      }
    }
    return copyWith(
      lastLevelIndex: current,
    );
  }

  CourseSession changeLevel({
    required int toLevelIndex,
    required int maxIndex
  }) {
    if (toLevelIndex <= maxIndex) {
      return copyWith(
        lastLevelIndex: toLevelIndex,
      );
    }
    return this;
  }
}

@freezed
abstract class LevelProgress with _$LevelProgress {

  // final String id;
  // final String levelId;
  // final int score;
  // final int total;
  // final DateTime startedAt;
  // final DateTime? completedAt;
  // final int? lastExerciseIndex;
  const LevelProgress._();

  const factory LevelProgress({
    required String id,
    required String levelId,
    required int score,
    required int total,
    required DateTime startedAt,
    DateTime? completedAt,
    int? lastExerciseIndex,
  }) = _LevelProgress;

  factory LevelProgress.newSession({
    required String levelId,
    required int exerciseCount
  }) {
    return LevelProgress(
      id: Uuid().v4(),
      levelId: levelId,
      score: 0,
      total: exerciseCount,
      startedAt: DateTime.now(),
      completedAt: null,
      lastExerciseIndex: null,
    );
  }

  bool get isCompleted => completedAt != null;

  LevelProgress markComplete() {
    return copyWith(
      completedAt: DateTime.now(),
    );
  }

  LevelProgress moveExercise({
    required int lastIndex,
    required int score,
    bool finished = false
  }) {
    return copyWith(
      score: score,
      lastExerciseIndex: lastIndex < total - 1 ? lastIndex : lastExerciseIndex,
      completedAt: finished ? DateTime.now() : null,
    );
  }
}

@freezed
abstract class ExerciseProgress with _$ExerciseProgress {
  // final String id;
  // final String exerciseId;
  // final int? selectedIndex;
  // final bool isCorrect;
  // final DateTime startedAt;
  // final DateTime? completedAt;

  const ExerciseProgress._();

  const factory ExerciseProgress({
    required String id,
    required String exerciseId,
    int? selectedIndex,
    required bool isCorrect,
    required DateTime startedAt,
    required DateTime? completedAt,
  }) = _ExerciseProgress;

  factory ExerciseProgress.newSession(String exerciseId) {
    return ExerciseProgress(
      id: Uuid().v4(),
      exerciseId: exerciseId,
      selectedIndex: null,
      isCorrect: false,
      startedAt: DateTime.now(),
      completedAt: null,
    );
  }

  bool get isCompleted => completedAt != null;
  bool get isSkipped => selectedIndex == null && completedAt == null;

  ExerciseProgress answered({required bool correct, required int selectedIndex}) {
    return copyWith(
        selectedIndex: selectedIndex,
        isCorrect: correct,
        completedAt: DateTime.now(),
    );
  }
}