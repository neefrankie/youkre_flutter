import 'package:flutter/cupertino.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/course_session.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';

class CourseViewModel extends ChangeNotifier {
  final Course course;

  bool _loading = true;
  String? _error;
  List<ExerciseLevel> _levels = [];
  final Map<String, bool> _levelsCompleted = {};
  CourseSession? _session;

  CourseViewModel({required this.course});

  bool get isLoading => _loading;
  String? get error => _error;
  List<ExerciseLevel> get levels => _levels;
  CourseSession? get courseSession => _session;

  ExerciseLevel? get currentLevel {
    final index = _session?.lastLevelIndex;
    if (index == null) {
      return null;
    }

    if (index < _levels.length) {
      return _levels[index];
    }

    return null;
  }

  bool get allLevelsComplete => levels.every((l) => isLevelCompleted(l.id));

  String get navTitle {
    final index = _session?.lastLevelIndex;
    if (index == null) {
      return '${course.title} $index';
    }

    return course.title;
  }

  bool get hasNextLevel {
    final index = _session?.lastLevelIndex;
    if (index == null) {
      return false;
    }

    return index < _levels.length - 1;
  }

  bool isLevelCompleted(String levelId) {
    return _levelsCompleted[levelId] ?? false;
  }

  ExerciseLevel? moveToNextLevel() {
    _session = _session?.advanceLevel(_levels.length - 1);
    notifyListeners();
    return currentLevel;
  }

  void changeLevel(int index) {
    _session = _session?.changeLevel(
      toLevelIndex: index,
      maxIndex: _levels.length - 1,
    );
  }

  void addCompletedLevel(LevelProgress progress) {
    _levelsCompleted[progress.levelId] = true;
  }

  Future<void> loadData() async {
    _loading = true;
    notifyListeners();

    try {
      final db = AppDatabase.instance();
      final levels = await ExerciseDataSource().loadLevels(course);

      final session = await db.sessionDao.loadOrCreateSession(
        course,
        levelCount: levels.length,
      );

      final allLevelProgress = await db.levelDao.getLatestProgressForSession(
        session.id,
      );

      _session = session;
      for (var progress in allLevelProgress) {
        _levelsCompleted[progress.id] = progress.isCompleted;
      }
      _session = session;
      _levels = levels;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> _updateSession(CourseSession session) async {
    try {
      final db = AppDatabase.instance();
      await db.sessionDao.updateSession(session);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateSession() async {
    final sess = _session;
    if (sess == null) {
      return;
    }

    await _updateSession(sess);
  }

  Future<void> tryCompleteSession() async {

    final newSession = _session?.markComplete();
    _session = newSession;

    if (newSession == null) {
      return;
    }
    if (!newSession.isCompleted) {
      return;
    }
    await _updateSession(newSession);
  }
}
