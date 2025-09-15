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

  bool get isLast => _currentPage == _exercises.length - 1;
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

  void advance() {
    if (_currentPage < _exercises.length - 1) {
      _currentPage += 1;
    }
  }

  void resetState() {
    _loading = false;
    _error = null;
    _currentPage = 0;
    _levelProgress = null;
    _exerciseStates.clear();
    notifyListeners();
  }

  Future<void> loadData({
    required Course course,
    required ExerciseLevel? level,
    required CourseSession? courseSession,
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

  Future<void> updateLevelProgress(ExerciseProgress exerciseProgress) async {
    _syncExerciseProgress(exerciseProgress);

    final allComplete = allAnswered;
    final progress = _levelProgress?.moveExercise(
      lastIndex: currentPage,
      score: score,
      finished: allComplete,
    );
    if (progress != null) {
      try {
        final db = AppDatabase.instance();
        await db.levelDao.updateProgress(progress);
        _levelProgress = progress;
      } catch (e) {
        print(e);
      }
    }
  }
}