import 'package:drift/drift.dart';

@DataClassName('CourseSessionEntity')
@TableIndex(name: 'course_id_idx', columns: {#courseId})
@TableIndex(name: 'course_completed_idx', columns: {#completedAt})
class CourseSessionSchema extends Table {
  TextColumn get id => text()();
  TextColumn get courseId => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get lastLevelIndex => integer().nullable()();
  IntColumn get contentVersion => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  String get tableName => 'course_session';
}


@DataClassName('LevelProgressEntity')
@TableIndex(name: 'level_id_idx', columns: {#levelId})
@TableIndex(name: 'level_completed_idx', columns: {#completedAt})
class LevelProgressSchema extends Table {
  TextColumn get id => text()();
  TextColumn get levelId => text()();
  IntColumn get score => integer()();
  IntColumn get total => integer()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get lastExerciseIndex => integer().nullable()();
  IntColumn get contentVersion => integer()();

  TextColumn get courseSessionId => text().references(CourseSessionSchema, #id)();

  @override
  String get tableName => 'level_progress';
}

@DataClassName('ExerciseProgressEntity')
@TableIndex(name: 'exercise_id_idx', columns: {#exerciseId})
@TableIndex(name: 'exercise_completed_idx', columns: {#completedAt})
class ExerciseProgressSchema extends Table {
  TextColumn get id => text()();
  TextColumn get exerciseId => text()();
  IntColumn get selectedIndex => integer().nullable()();
  BoolColumn get isCorrect => boolean()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  TextColumn get courseSessionId => text().references(CourseSessionSchema, #id)();
  TextColumn get levelProgressId => text().references(LevelProgressSchema, #id)();

  @override
  String get tableName => 'exercise_progress';
}