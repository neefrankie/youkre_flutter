// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CourseSessionCWProxy {
  CourseSession id(String id);

  CourseSession courseId(String courseId);

  CourseSession startedAt(DateTime startedAt);

  CourseSession completedAt(DateTime? completedAt);

  CourseSession lastLevelIndex(int? lastLevelIndex);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CourseSession(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CourseSession(...).copyWith(id: 12, name: "My name")
  /// ```
  CourseSession call({
    String id,
    String courseId,
    DateTime startedAt,
    DateTime? completedAt,
    int? lastLevelIndex,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCourseSession.copyWith(...)` or call `instanceOfCourseSession.copyWith.fieldName(value)` for a single field.
class _$CourseSessionCWProxyImpl implements _$CourseSessionCWProxy {
  const _$CourseSessionCWProxyImpl(this._value);

  final CourseSession _value;

  @override
  CourseSession id(String id) => call(id: id);

  @override
  CourseSession courseId(String courseId) => call(courseId: courseId);

  @override
  CourseSession startedAt(DateTime startedAt) => call(startedAt: startedAt);

  @override
  CourseSession completedAt(DateTime? completedAt) =>
      call(completedAt: completedAt);

  @override
  CourseSession lastLevelIndex(int? lastLevelIndex) =>
      call(lastLevelIndex: lastLevelIndex);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CourseSession(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CourseSession(...).copyWith(id: 12, name: "My name")
  /// ```
  CourseSession call({
    Object? id = const $CopyWithPlaceholder(),
    Object? courseId = const $CopyWithPlaceholder(),
    Object? startedAt = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
    Object? lastLevelIndex = const $CopyWithPlaceholder(),
  }) {
    return CourseSession(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      courseId: courseId == const $CopyWithPlaceholder() || courseId == null
          ? _value.courseId
          // ignore: cast_nullable_to_non_nullable
          : courseId as String,
      startedAt: startedAt == const $CopyWithPlaceholder() || startedAt == null
          ? _value.startedAt
          // ignore: cast_nullable_to_non_nullable
          : startedAt as DateTime,
      completedAt: completedAt == const $CopyWithPlaceholder()
          ? _value.completedAt
          // ignore: cast_nullable_to_non_nullable
          : completedAt as DateTime?,
      lastLevelIndex: lastLevelIndex == const $CopyWithPlaceholder()
          ? _value.lastLevelIndex
          // ignore: cast_nullable_to_non_nullable
          : lastLevelIndex as int?,
    );
  }
}

extension $CourseSessionCopyWith on CourseSession {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCourseSession.copyWith(...)` or `instanceOfCourseSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CourseSessionCWProxy get copyWith => _$CourseSessionCWProxyImpl(this);
}

abstract class _$LevelProgressCWProxy {
  LevelProgress id(String id);

  LevelProgress levelId(String levelId);

  LevelProgress total(int total);

  LevelProgress score(int score);

  LevelProgress startedAt(DateTime startedAt);

  LevelProgress completedAt(DateTime? completedAt);

  LevelProgress lastExerciseIndex(int? lastExerciseIndex);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LevelProgress(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LevelProgress(...).copyWith(id: 12, name: "My name")
  /// ```
  LevelProgress call({
    String id,
    String levelId,
    int total,
    int score,
    DateTime startedAt,
    DateTime? completedAt,
    int? lastExerciseIndex,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLevelProgress.copyWith(...)` or call `instanceOfLevelProgress.copyWith.fieldName(value)` for a single field.
class _$LevelProgressCWProxyImpl implements _$LevelProgressCWProxy {
  const _$LevelProgressCWProxyImpl(this._value);

  final LevelProgress _value;

  @override
  LevelProgress id(String id) => call(id: id);

  @override
  LevelProgress levelId(String levelId) => call(levelId: levelId);

  @override
  LevelProgress total(int total) => call(total: total);

  @override
  LevelProgress score(int score) => call(score: score);

  @override
  LevelProgress startedAt(DateTime startedAt) => call(startedAt: startedAt);

  @override
  LevelProgress completedAt(DateTime? completedAt) =>
      call(completedAt: completedAt);

  @override
  LevelProgress lastExerciseIndex(int? lastExerciseIndex) =>
      call(lastExerciseIndex: lastExerciseIndex);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LevelProgress(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LevelProgress(...).copyWith(id: 12, name: "My name")
  /// ```
  LevelProgress call({
    Object? id = const $CopyWithPlaceholder(),
    Object? levelId = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? score = const $CopyWithPlaceholder(),
    Object? startedAt = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
    Object? lastExerciseIndex = const $CopyWithPlaceholder(),
  }) {
    return LevelProgress(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      levelId: levelId == const $CopyWithPlaceholder() || levelId == null
          ? _value.levelId
          // ignore: cast_nullable_to_non_nullable
          : levelId as String,
      total: total == const $CopyWithPlaceholder() || total == null
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
      score: score == const $CopyWithPlaceholder() || score == null
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as int,
      startedAt: startedAt == const $CopyWithPlaceholder() || startedAt == null
          ? _value.startedAt
          // ignore: cast_nullable_to_non_nullable
          : startedAt as DateTime,
      completedAt: completedAt == const $CopyWithPlaceholder()
          ? _value.completedAt
          // ignore: cast_nullable_to_non_nullable
          : completedAt as DateTime?,
      lastExerciseIndex: lastExerciseIndex == const $CopyWithPlaceholder()
          ? _value.lastExerciseIndex
          // ignore: cast_nullable_to_non_nullable
          : lastExerciseIndex as int?,
    );
  }
}

extension $LevelProgressCopyWith on LevelProgress {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLevelProgress.copyWith(...)` or `instanceOfLevelProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LevelProgressCWProxy get copyWith => _$LevelProgressCWProxyImpl(this);
}

abstract class _$ExerciseProgressCWProxy {
  ExerciseProgress id(String id);

  ExerciseProgress exerciseId(String exerciseId);

  ExerciseProgress selectedIndex(int? selectedIndex);

  ExerciseProgress isCorrect(bool isCorrect);

  ExerciseProgress startedAt(DateTime startedAt);

  ExerciseProgress completedAt(DateTime? completedAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ExerciseProgress(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ExerciseProgress(...).copyWith(id: 12, name: "My name")
  /// ```
  ExerciseProgress call({
    String id,
    String exerciseId,
    int? selectedIndex,
    bool isCorrect,
    DateTime startedAt,
    DateTime? completedAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfExerciseProgress.copyWith(...)` or call `instanceOfExerciseProgress.copyWith.fieldName(value)` for a single field.
class _$ExerciseProgressCWProxyImpl implements _$ExerciseProgressCWProxy {
  const _$ExerciseProgressCWProxyImpl(this._value);

  final ExerciseProgress _value;

  @override
  ExerciseProgress id(String id) => call(id: id);

  @override
  ExerciseProgress exerciseId(String exerciseId) =>
      call(exerciseId: exerciseId);

  @override
  ExerciseProgress selectedIndex(int? selectedIndex) =>
      call(selectedIndex: selectedIndex);

  @override
  ExerciseProgress isCorrect(bool isCorrect) => call(isCorrect: isCorrect);

  @override
  ExerciseProgress startedAt(DateTime startedAt) => call(startedAt: startedAt);

  @override
  ExerciseProgress completedAt(DateTime? completedAt) =>
      call(completedAt: completedAt);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ExerciseProgress(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ExerciseProgress(...).copyWith(id: 12, name: "My name")
  /// ```
  ExerciseProgress call({
    Object? id = const $CopyWithPlaceholder(),
    Object? exerciseId = const $CopyWithPlaceholder(),
    Object? selectedIndex = const $CopyWithPlaceholder(),
    Object? isCorrect = const $CopyWithPlaceholder(),
    Object? startedAt = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
  }) {
    return ExerciseProgress(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      exerciseId:
          exerciseId == const $CopyWithPlaceholder() || exerciseId == null
          ? _value.exerciseId
          // ignore: cast_nullable_to_non_nullable
          : exerciseId as String,
      selectedIndex: selectedIndex == const $CopyWithPlaceholder()
          ? _value.selectedIndex
          // ignore: cast_nullable_to_non_nullable
          : selectedIndex as int?,
      isCorrect: isCorrect == const $CopyWithPlaceholder() || isCorrect == null
          ? _value.isCorrect
          // ignore: cast_nullable_to_non_nullable
          : isCorrect as bool,
      startedAt: startedAt == const $CopyWithPlaceholder() || startedAt == null
          ? _value.startedAt
          // ignore: cast_nullable_to_non_nullable
          : startedAt as DateTime,
      completedAt: completedAt == const $CopyWithPlaceholder()
          ? _value.completedAt
          // ignore: cast_nullable_to_non_nullable
          : completedAt as DateTime?,
    );
  }
}

extension $ExerciseProgressCopyWith on ExerciseProgress {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfExerciseProgress.copyWith(...)` or `instanceOfExerciseProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExerciseProgressCWProxy get copyWith => _$ExerciseProgressCWProxyImpl(this);
}
