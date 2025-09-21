import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youkre_flutter/core/models/course_session.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';

import 'tables.dart';

part 'database.g.dart';

extension CourseSessionX on CourseSession {
  CourseSessionSchemaCompanion toCompanion(int version) {
    return CourseSessionSchemaCompanion.insert(
      id: id,
      courseId: courseId,
      startedAt: startedAt,
      completedAt: Value(completedAt),
      lastLevelIndex: Value(lastLevelIndex),
      contentVersion: version,
    );
  }
}

extension on CourseSessionEntity {
  CourseSession toModel() {
    return CourseSession(
      id: id,
      courseId: courseId,
      startedAt: startedAt,
      completedAt: completedAt,
      lastLevelIndex: lastLevelIndex,
    );
  }
}

extension LevelProgressX on LevelProgress {
  // LevelProgress -> LevelProgressEntity
  LevelProgressSchemaCompanion toCompanion({
    required String courseSessionId,
    required int version
  }) {
    return LevelProgressSchemaCompanion.insert(
      id: id,
      levelId: levelId,
      score: score,
      total: total,
      startedAt: startedAt,
      completedAt: Value(completedAt),
      lastExerciseIndex: Value(lastExerciseIndex),
      courseSessionId: courseSessionId,
      contentVersion: version,
    );
  }
}

extension on LevelProgressEntity {
  LevelProgress toModel() {
    return LevelProgress(
      id: id,
      levelId: levelId,
      total: total,
      score: score,
      startedAt: startedAt,
      completedAt: completedAt,
      lastExerciseIndex: lastExerciseIndex,
    );
  }
}

extension ExerciseProgressX on ExerciseProgress {
  // ExerciseProgress -> ExerciseProgressSchemaCompanion
  ExerciseProgressSchemaCompanion toCompanion({
    required String courseSessionId,
    required String levelProgressId
  }) {
    return ExerciseProgressSchemaCompanion.insert(
        id: id,
        exerciseId: exerciseId,
        selectedIndex: Value(selectedIndex),
        isCorrect: isCorrect,
        startedAt: startedAt,
        completedAt: Value(completedAt),
        courseSessionId: courseSessionId,
        levelProgressId: levelProgressId
    );
  }
}

extension ExerciseProgressEntityX on ExerciseProgressEntity {
  ExerciseProgress toModel() {
    return ExerciseProgress(
      id: id,
      exerciseId: exerciseId,
      selectedIndex: selectedIndex,
      isCorrect: isCorrect,
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }
}

@DriftAccessor(
    tables: [
      CourseSessionSchema,
    ]
)
class CourseDao extends DatabaseAccessor<AppDatabase> with _$CourseDaoMixin {
  CourseDao(AppDatabase db) : super(db);

  Future<CourseSessionEntity?> loadLastSession(String courseId) async {
    return await (select(courseSessionSchema)
        ..where((tbl) =>
          tbl.courseId.equals(courseId)
        )
        ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)])
        ..limit(1)
      )
      .getSingleOrNull();
  }
  
  Future<CourseSession> createSession(Course course) async {
    final session = CourseSession
        .newSession(course.id);

    final row = session.toCompanion(course.contentVersion);

    await into(courseSessionSchema).insert(row);

    return session;
  }

  Future<void> updateSession(CourseSession session) async {
    await (update(courseSessionSchema)
      ..where((tbl) => tbl.id.equals(session.id))
    )
      .write(CourseSessionSchemaCompanion(
        lastLevelIndex: Value(session.lastLevelIndex),
        completedAt: Value(session.completedAt),
      ));
  }

  Future<CourseSession> loadOrCreateSession(Course course, {
    required int levelCount
  }) async {
    final courseEntity = await loadLastSession(course.id);
    if (courseEntity != null) {
      if (courseEntity.contentVersion == course.contentVersion) {
        return courseEntity.toModel();
      } else {
        await (delete(courseSessionSchema)
          ..where((t) => t.id.equals(courseEntity.id))
        ).go();
      }
    }

    final newSession = await createSession(course);
    return newSession;
  }
}

// level_progress table.
@DriftAccessor(
    tables: [
      LevelProgressSchema,
    ]
)
class LevelDao extends DatabaseAccessor<AppDatabase> with _$LevelDaoMixin {
  LevelDao(AppDatabase db) : super(db);

  static const _table = 'level_progress';
  static const _levelId = 'level_id';
  static const _startedAt = 'started_at';
  static const _courseSessionId = 'course_session_id';

  Future<LevelProgressEntity?> findLastLevel(String levelId, {
    required String courseSessionId,
  }) async {
    return await (select(levelProgressSchema)
        ..where((tbl) =>
          tbl.levelId.equals(levelId) &
          tbl.courseSessionId.equals(courseSessionId)
        )
        ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)])
        ..limit(1)
      )
      .getSingleOrNull();
  }

  Future<LevelProgress> createProgress(ExerciseLevel level, {
    required CourseSession courseSession,
    required int exerciseCount
  }) async {
    final progress = LevelProgress
        .newSession(
      levelId: level.id,
      exerciseCount: exerciseCount,
    );

    final row = progress.toCompanion(
      courseSessionId: courseSession.id,
      version: level.contentVersion,
    );

    await into(levelProgressSchema).insert(row);

    return progress;
  }

  Future<LevelProgress> loadOrCreateProgress(ExerciseLevel level, {
    required CourseSession session,
    required int exerciseCount
  }) async {
    final levelEntity = await findLastLevel(
      level.id,
      courseSessionId: session.id,
    );
    if (levelEntity != null) {
      if (levelEntity.contentVersion == level.contentVersion) {
        return levelEntity.toModel();
      } else {
        await (delete(levelProgressSchema)
          ..where((t) => t.id.equals(levelEntity.id))
        ).go();
      }
    }

    final courseSession = await createProgress(
      level,
      courseSession: session,
      exerciseCount: exerciseCount,
    );
    return courseSession;
  }
  
  Future<LevelProgressEntity?> findLevel(LevelProgress level) async {
    return await (select(levelProgressSchema)
        ..where((tbl) =>
        tbl.id.equals(level.id)
        )
        ..limit(1)
      )
      .getSingleOrNull();
  }

  Future<void> updateProgress(LevelProgress progress) async {
    await (update(levelProgressSchema)
        ..where((tbl) => tbl.id.equals(progress.id))
      )
      .write(LevelProgressSchemaCompanion(
        score: Value(progress.score),
        lastExerciseIndex: Value(progress.lastExerciseIndex),
        completedAt: Value(progress.completedAt),
      ));
  }

  Future<List<LevelProgress>> getLatestProgressForSession(
      String sessionId,
    ) async {
    final sql = '''
    SELECT *
    FROM (
      SELECT *,
        ROW_NUMBER() OVER (
          PARTITION BY $_levelId 
          ORDER BY $_startedAt DESC
        ) AS rn
      FROM $_table
      WHERE $_courseSessionId = ?
    ) WHERE rn = 1
    ''';

    final rows = await customSelect(
      sql,
      variables: [Variable(sessionId)],
      readsFrom: {levelProgressSchema},
    ).map((row) {
      return LevelProgressEntity(
        id: row.read('id'),
        levelId: row.read('level_id'),
        score: row.read('score'),
        total: row.read('total'),
        startedAt: row.read('started_at') as DateTime,
        completedAt: row.read('completed_at') as DateTime?,
        lastExerciseIndex: row.read('last_exercise_index') as int?,
        contentVersion: row.read('content_version'),
        courseSessionId: row.read('course_sessionId'),
      );
    }).get();

    return rows.map((row) => row.toModel()).toList();
  }
}

@DriftAccessor(
    tables: [
      ExerciseProgressSchema,
    ]
)
class ExerciseDao extends DatabaseAccessor<AppDatabase> with _$ExerciseDaoMixin {
  ExerciseDao(AppDatabase db) : super(db);

  Future<ExerciseProgress> createProgress(Exercise exercise, {
    required String courseSessionId,
    required String levelProgressId,
  }) async {
    final session = ExerciseProgress
        .newSession(exercise.id);

    final row = session.toCompanion(
      courseSessionId: courseSessionId,
      levelProgressId: levelProgressId,
    );

    await into(exerciseProgressSchema).insert(row);

    return session;
  }

  // Find exercise progress for a exercise under a certain level progress.
  Future<ExerciseProgressEntity?> findLastProgress({
    required String exerciseId,
    required String levelProgressId,
  }) async {
    return await (select(exerciseProgressSchema)
      ..where((tbl) =>
        tbl.exerciseId.equals(exerciseId) &
        tbl.levelProgressId.equals(levelProgressId)
      )
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)])
      ..limit(1)
    )
        .getSingleOrNull();
  }

  Future<ExerciseProgress> loadOrCreateProgress(Exercise exercise, {
    required CourseSession courseSession,
    required LevelProgress levelProgress,
  }) async {
    final exerciseProgress = await findLastProgress(
      exerciseId: exercise.id,
      levelProgressId: levelProgress.id,
    );
    if (exerciseProgress != null) {
      return exerciseProgress.toModel();
    }

    final newProgress = await createProgress(
      exercise,
      courseSessionId: courseSession.id,
      levelProgressId: levelProgress.id,
    );
    return newProgress;
  }

  Future<List<ExerciseProgress>> allProgressOfLevel({
    required String levelProgressId,
  }) async {
    final rows = await (select(exerciseProgressSchema)
        ..where((tbl) => tbl.levelProgressId.equals(levelProgressId))
      )
      .get();
    return rows.map((row) => row.toModel()).toList();
  }

  Future<void> updateProgress(ExerciseProgress progress) async {
    await (update(exerciseProgressSchema)
        ..where((tbl) => tbl.id.equals(progress.id))
      )
      .write(ExerciseProgressSchemaCompanion(
        selectedIndex: Value(progress.selectedIndex),
        isCorrect: Value(progress.isCorrect),
        completedAt: Value(progress.completedAt),
      ));
  }
}

@DriftDatabase(
    tables: [
      CourseSessionSchema,
      LevelProgressSchema,
      ExerciseProgressSchema
    ]
)
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase.instance() => _instance;
  AppDatabase._internal() : super(_openConnection());

  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());


  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationDocumentsDirectory,
      ),
    );
  }

  late final sessionDao = CourseDao(this);
  late final levelDao = LevelDao(this);
  late final exerciseDao = ExerciseDao(this);
}