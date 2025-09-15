import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:uuid/uuid.dart';

part 'course_session.g.dart';

@CopyWith()
class CourseSession {
  final String id;
  final String courseId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? lastLevelIndex;

  CourseSession({
    required this.id,
    required this.courseId,
    required this.startedAt,
    this.completedAt,
    this.lastLevelIndex,
  });

  factory CourseSession.newSession(String courseId, int levelCount) {
    return CourseSession(
      id: const Uuid().v4(),
      courseId: courseId,
      startedAt: DateTime.now(),
      completedAt: null,
      lastLevelIndex: levelCount > 0 ? 0 : null,
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

@CopyWith()
class LevelProgress {
  final String id;
  final String levelId;
  final int score;
  final int total;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? lastExerciseIndex;

  LevelProgress({
    required this.id,
    required this.levelId,
    required this.total,
    required this.score,
    required this.startedAt,
    this.completedAt,
    this.lastExerciseIndex
  });

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

@CopyWith()
class ExerciseProgress {
  final String id;
  final String exerciseId;
  final int? selectedIndex;
  final bool isCorrect;
  final DateTime startedAt;
  final DateTime? completedAt;

  ExerciseProgress({
    required this.id,
    required this.exerciseId,
    this.selectedIndex,
    required this.isCorrect,
    required this.startedAt,
    this.completedAt,
  });

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