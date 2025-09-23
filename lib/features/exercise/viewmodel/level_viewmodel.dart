import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';
import 'package:youkre_flutter/core/models/course_session.dart';

class LevelDetailViewModel extends ChangeNotifier {
  final logger = Logger('LevelDetailViewModel');

  LevelDetailViewModel();

  final Map<String, ExerciseProgress> _exerciseStates = {};
  int _currentPage = 0;

  bool isLoading = true;
  String? error;
  LevelProgress? levelProgress;
  List<Exercise> exercises = [];
  int get currentPage => _currentPage;

  bool get isLast => _currentPage == exercises.length - 1;

  bool get lastAnswered {
    if (exercises.isEmpty) {
      return false;
    }

    final progress = _exerciseStates[exercises.last.id];
    if (progress == null) {
      return false;
    }

    return progress.isCompleted;
  }

  String get progressText => '${_currentPage+1} / ${exercises.length}';

  Exercise? get currentExercise {
    if (currentPage >= exercises.length) {
      return null;
    }

    return exercises[currentPage];
  }

  int get score => exercises.fold(0, (prev, ex) {
    if (_exerciseStates[ex.id]?.isCorrect == true) {
      return prev + 1;
    } else {
      return prev;
    }
  });

  bool get allAnswered => exercises.every((ex) => _exerciseStates.containsKey(ex.id));

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  ExerciseProgress? getExerciseProgress(String exerciseId) {
    return _exerciseStates[exerciseId];
  }

  void advance() {
    if (_currentPage < exercises.length - 1) {
      _currentPage += 1;
    }
  }

  void setLevelComplete() {
    levelProgress = levelProgress?.markComplete();
  }

  void resetState() {
    logger.info("resetting state");
    isLoading = true;
    error = null;
    _currentPage = 0;
    _exerciseStates.clear();
    exercises = [];
    notifyListeners();

    levelProgress = null;
  }

  Future<void> loadData({
    required ExerciseLevel? level,
    required CourseSession? courseSession,
    required Course course,
  }) async {
    logger.info('loading level data');
    isLoading = true;
    notifyListeners();

    if (courseSession == null) {
      isLoading = false;
      error = 'Missing course session';
      notifyListeners();
      return;
    }

    if (level == null) {
      isLoading = false;
      error = 'Missing level';
      notifyListeners();
      return;
    }

    try {
      final exercises = await ExerciseDataSource().loadExercises(level);
      logger.info('loaded ${exercises.length} exercises of level ${level.id}');

      final db = AppDatabase.instance();

      final levelProgress = await db.levelDao.loadOrCreateProgress(
          level,
          session: courseSession,
          exerciseCount: exercises.length,
      );
      logger.info('loaded level progress ${levelProgress.id}');

      final allExerciseProgress = await db.exerciseDao.allProgressOfLevel(
        levelProgressId: levelProgress.id
      );
      logger.info('loaded ${allExerciseProgress.length} exercise progress of level progress ${levelProgress.id}');

      for (var ep in allExerciseProgress) {
        _syncExerciseProgress(ep);
      }
      this.levelProgress = levelProgress;
      this.exercises = exercises;
      notifyListeners();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _restart({
    required ExerciseLevel? level,
    required CourseSession? courseSession,
    required Course course,
  }) async {
    logger.info('loading level data');
    isLoading = true;
    notifyListeners();

    if (courseSession == null) {
      isLoading = false;
      error = 'Missing course session';
      notifyListeners();
      return;
    }

    if (level == null) {
      isLoading = false;
      error = 'Missing level';
      notifyListeners();
      return;
    }

    try {
      final exercises = await ExerciseDataSource().loadExercises(level);
      logger.info('loaded ${exercises.length} exercises of level ${level.id}');

      final db = AppDatabase.instance();

      final levelProgress = await db.levelDao.createProgress(
        level,
        courseSession: courseSession,
        exerciseCount: exercises.length,
      );
      logger.info('loaded level progress ${levelProgress.id}');

      final allExerciseProgress = await db.exerciseDao.allProgressOfLevel(
          levelProgressId: levelProgress.id
      );
      logger.info('loaded ${allExerciseProgress.length} exercise progress of level progress ${levelProgress.id}');

      for (var ep in allExerciseProgress) {
        _syncExerciseProgress(ep);
      }
      this.levelProgress = levelProgress;
      this.exercises = exercises;
      notifyListeners();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _syncExerciseProgress(ExerciseProgress exerciseProgress) {
    _exerciseStates[exerciseProgress.exerciseId] = exerciseProgress;
  }

  Future<void> _updateProgress(LevelProgress progress) async {
    try {
      final db = AppDatabase.instance();
      await db.levelDao.updateProgress(progress);
    } catch (e) {
      logger.severe(e);
    }
  }

  Future<void> updateLevelProgress(ExerciseProgress exerciseProgress) async {
    _syncExerciseProgress(exerciseProgress);

    final progress = levelProgress?.moveExercise(
      lastIndex: currentPage,
      score: score,
    );
    if (progress != null) {
      await _updateProgress(progress);
    }
  }

  Future<LevelProgress?> restartCurrentLevel({
    ExerciseLevel? level,
    CourseSession? session,
    required Course course,
  }) async {
    setLevelComplete();
    logger.info('restart current level: ${level?.id}');
    
    final progress = levelProgress;
    logger.info('current level progress ${progress?.id}');

    if (progress != null) {
      logger.info('update level progress');
      await _updateProgress(progress);
    }

    resetState();

    await _restart(level: level, courseSession: session, course: course);

    return progress;
  }

  Future<LevelProgress?> startNewLevel({
    ExerciseLevel? level,
    CourseSession? session,
    required Course course,
  }) async {
    setLevelComplete();
    logger.info('start new level ${level?.id}');

    final progress = levelProgress;
    if (progress != null) {
      logger.info('save previous exercise progress ${progress.id}');
      await _updateProgress(progress);
    }

    resetState();

    await loadData(level: level, courseSession: session, course: course);

    return progress;
  }
}