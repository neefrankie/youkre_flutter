import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';
import 'package:youkre_flutter/core/models/course_session.dart';

class LevelDetailViewModel extends ChangeNotifier {

  LevelDetailViewModel();

  bool _loading = true;
  String? _error;
  LevelProgress? _levelProgress;
  List<Exercise> _exercises = [];
  final Map<String, ExerciseProgress> _exerciseStates = {};

  int _currentPage = 0;

  bool get isLoading => _loading;
  String? get error => _error;
  LevelProgress? get levelProgress => _levelProgress;
  List<Exercise> get exercises => _exercises;
  int get currentPage => _currentPage;

  bool showSummary = false;

  bool get isLast => _currentPage == _exercises.length - 1;

  bool get lastAnswered {
    if (_exercises.isEmpty) {
      return false;
    }

    final progress = _exerciseStates[_exercises.last.id];
    if (progress == null) {
      return false;
    }

    return progress.isCompleted;
  }

  String get progressText => '${_currentPage+1} / ${_exercises.length}';

  Exercise? get currentExercise {
    if (currentPage >= _exercises.length) {
      return null;
    }

    return _exercises[currentPage];
  }

  int get score => _exercises.fold(0, (prev, ex) {
    if (_exerciseStates[ex.id]?.isCorrect == true) {
      return prev + 1;
    } else {
      return prev;
    }
  });

  bool get allAnswered => _exercises.every((ex) => _exerciseStates.containsKey(ex.id));

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void onSummary() {
    showSummary = true;
  }

  void advance() {
    if (_currentPage < _exercises.length - 1) {
      _currentPage += 1;
    }
  }

  void setLevelComplete() {
    _levelProgress = _levelProgress?.markComplete();
  }

  void resetState() {
    _loading = false;
    _error = null;
    _currentPage = 0;
    _levelProgress = null;
    _exerciseStates.clear();
    showSummary = false;
    notifyListeners();
  }

  Future<void> loadData({
    required ExerciseLevel? level,
    required CourseSession? courseSession,
    required Course course,
  }) async {
    _loading = true;
    notifyListeners();

    if (courseSession == null) {
      _loading = false;
      _error = 'Missing course session';
      notifyListeners();
      return;
    }

    if (level == null) {
      _loading = false;
      _error = 'Missing level';
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

      final allExerciseProgress = await db.exerciseDao.allProgressOfLevel(
        levelProgressId: levelProgress.id
      );

      for (var ep in allExerciseProgress) {
        _syncExerciseProgress(ep);
      }
      _levelProgress = levelProgress;
      _exercises = exercises;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
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
    _loading = true;
    notifyListeners();

    if (courseSession == null) {
      _loading = false;
      _error = 'Missing course session';
      notifyListeners();
      return;
    }

    if (level == null) {
      _loading = false;
      _error = 'Missing level';
      notifyListeners();
      return;
    }

    try {
      final db = AppDatabase.instance();

      final levelProgress = await db.levelDao.loadOrCreateProgress(
        level,
        session: courseSession,
        exerciseCount: exercises.length,
      );

      _levelProgress = levelProgress;
      _exercises = exercises;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
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

    final progress = _levelProgress?.moveExercise(
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
    
    final progress = _levelProgress;
    if (progress != null) {
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

    final progress = _levelProgress;
    if (progress != null) {
      await _updateProgress(progress);
    }

    resetState();

    await loadData(level: level, courseSession: session, course: course);

    return progress;
  }
}