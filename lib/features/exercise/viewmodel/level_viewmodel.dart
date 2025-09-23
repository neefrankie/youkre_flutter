import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';
import 'package:youkre_flutter/core/models/course_session.dart';

class LevelDetailViewModel extends ChangeNotifier {

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
    print("resetting state");
    isLoading = true;
    error = null;
    _currentPage = 0;
    levelProgress = null;
    _exerciseStates.clear();
    notifyListeners();
  }

  Future<void> loadData({
    required ExerciseLevel? level,
    required CourseSession? courseSession,
    required Course course,
  }) async {
    print('loading data');
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

      final db = AppDatabase.instance();

      final levelProgress = await db.levelDao.loadOrCreateProgress(
          level,
          session: courseSession,
          exerciseCount: exercises.length,
      );
      print('loaded level progress ${levelProgress.id}');

      final allExerciseProgress = await db.exerciseDao.allProgressOfLevel(
        levelProgressId: levelProgress.id
      );

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

  Future<void> _restart({
    required ExerciseLevel? level,
    required CourseSession? courseSession,
    required Course course,
  }) async {
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
      final db = AppDatabase.instance();
      print('create new level progress');
      final levelProgress = await db.levelDao.createProgress(
        level,
        courseSession: courseSession,
        exerciseCount: exercises.length,
      );
      print('new level progress ${levelProgress.id}');

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

  Future<void> _updateProgress(LevelProgress progress) async {
    try {
      final db = AppDatabase.instance();
      await db.levelDao.updateProgress(progress);
    } catch (e) {
      print(e);
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
    print('restart current level: ${level?.id}');
    
    final progress = levelProgress;
    print('current level progress ${progress?.id}');

    if (progress != null) {
      print('update level progress');
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

    final progress = levelProgress;
    if (progress != null) {
      await _updateProgress(progress);
    }

    resetState();

    await loadData(level: level, courseSession: session, course: course);

    return progress;
  }
}