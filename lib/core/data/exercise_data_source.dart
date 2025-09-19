import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/course_kind.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';
import 'package:youkre_flutter/core/models/multiple_choice.dart';
import 'package:youkre_flutter/core/models/toc_entry.dart';
import 'package:youkre_flutter/core/services/database_service.dart';

class ExerciseDataSource {
  ExerciseDataSource._();
  static final ExerciseDataSource _instance = ExerciseDataSource._();
  factory ExerciseDataSource() => _instance;

  Database? _db;

  static const courseTable = 'course';

  static const colId = 'id';
  static const colContentVersion = 'content_version';
  static const colTitle = 'title';

  static const levelTable = 'exercise_level';
  static const colCourseId = 'course_id';
  static const colCourseSlug = 'course_slug';
  static const colArticleId = 'article_id';
  static const colArticleSlug = 'article_slug';

  static const exerciseTable = 'exercise';
  static const colLevelId = 'level_id';
  static const colPrompts = 'prompts';
  static const colMultipleChoice = 'multiple_choice';
  static const colExplanation = 'explanation';
  static const colCourseKind = 'course_kind';


  Future<Database> _getDatabase() async {
    if (_db?.isOpen == true) {
      return _db!;
    }

    final dbPath = await DatabaseService().getDatabasePath();
    _db = await openDatabase(
      dbPath,
      readOnly: true,
    );

    return _db!;
  }

  Course _convertCourse(Map<String, Object?> row) {
    return Course(
      id: row['id'] as String,
      slug: row['slug'] as String,
      title: row['title'] as String,
      summary: row['summary'] as String?,
      exerciseCover: row['exercise_cover'] as String,
      contentVersion: row['content_version'] as int,
    );
  }

  Future<List<Course>> loadCourses() async {
    final db = await _getDatabase();
    final maps = await db.query(courseTable);

    return maps.map(_convertCourse).toList();
  }

  Future<Course?> findCourseById(String id) async {
    final db = await _getDatabase();
    final maps = await db.query(
      courseTable,
      where: '$colId = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    final row = maps.first;
    return _convertCourse(row);
  }

  Future<List<TocEntry>> findTocList(Course course) async {
    final db = await _getDatabase();
    final maps = await db.query(
      courseTable,
      where: '$colId = ?',
      whereArgs: [course.id],
      limit: 1,
    );
    if (maps.isEmpty) return [];
    final row = maps.first;
    return _decodeToc(row);
  }

  List<TocEntry> _decodeToc(Map<String, Object?> row) {
    final jsonString = row['toc_list'] as String;
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final List<TocEntry> tocEntries = jsonList.map((item) =>
        TocEntry.fromJson(item)
      ).toList();

    return tocEntries;
  }

  ExerciseLevel _convertLevel(Map<String, Object?> row) {
    return ExerciseLevel(
      id: row[colId] as String,
      courseID: row[colCourseId] as String,
      courseSlug: row[colCourseSlug] as String,
      chapterID: row[colArticleId] as String,
      chapterSlug: row[colArticleSlug] as String,
      title: row[colTitle] as String,
      contentVersion: row[colContentVersion] as int,
    );
  }

  Future<List<ExerciseLevel>> loadLevels(Course course) async {
    final db = await _getDatabase();
    final rows = await db.query(
      levelTable,
      where: '$colCourseId = ?',
      whereArgs: [course.id],
      orderBy: '`index` ASC',
    );
    
    return rows.map(_convertLevel).toList();
  }

  Future<ExerciseLevel?> findLevelById(String id) async {
    final db = await _getDatabase();
    final maps = await db.query(
      levelTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    final row = maps.first;
    return _convertLevel(row);
  }

  Exercise _convertExercise(Map<String, Object?> row) {
    final jsonStr = row[colMultipleChoice] as String;
    final choiceMap = jsonDecode(jsonStr) as Map<String, dynamic>;
    final multiChoice = MultipleChoice.fromJson(choiceMap);

    return Exercise(
      id: row[colId] as String,
      levelId: row[colLevelId] as String,
      prompts: row[colPrompts] as String,
      multipleChoice: multiChoice,
      explanation: row[colExplanation] as String?,
    );
  }

  Future<List<Exercise>> loadExercises(ExerciseLevel level) async {
    final db = await _getDatabase();
    final rows = await db.query(
      exerciseTable,
      where: '$colLevelId = ?',
      whereArgs: [level.id],
      orderBy: '`index` ASC',
    );

    return rows.map(_convertExercise).toList();
  }

  Future<Exercise?> findExerciseById(String id) async {
    final db = await _getDatabase();
    final maps = await db.query(
      exerciseTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    final row = maps.first;
    return _convertExercise(row);
  }

  Future<Exercise> findRandomExercise(CourseKind kind) async {
    final db = await _getDatabase();

    String? where;
    List<Object?> whereArgs = [];

    if (kind != CourseKind.all) {
      where = '$colCourseKind = ?';
      whereArgs.add(kind.name);
    }
    final rows = await db.query(
      exerciseTable,
      where: where,
      whereArgs: whereArgs,
      orderBy: 'RANDOM()',
      limit: 1,
    );

    if (rows.isEmpty) throw("Unable to find any exercise!");

    final row = rows.first;
    return _convertExercise(row);
  }

  Future<void> close() async {
    if (_db != null && _db!.isOpen) {
      await _db!.close();
      _db = null;
    }
  }
}