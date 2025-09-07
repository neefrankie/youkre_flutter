import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';
import 'package:youkre_flutter/core/models/course_kind.dart';
import 'package:youkre_flutter/core/models/daily_exercise_info.dart';

// Usage:
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // 初始化 PreferenceService
//   final prefs = PreferenceService();
//   await prefs.init();
//
//   runApp(MyApp());
// }
class PreferenceService {
  static const String _courseKey = 'course';
  static const String _dailyIdKey = 'daily_exercise_id';
  static const String _dailyLastDateKey = 'daily_last_date';
  static const String _dailyIndexKey = 'daily_selected_index';

  late final SharedPreferences _prefs;

  static final PreferenceService _instance = PreferenceService._();
  factory PreferenceService() => _instance;
  PreferenceService._();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  CourseKind getCourse() {
    final name = _prefs.getString(_courseKey);
    return CourseKind.values.firstWhereOrNull((c) => c.name == name) ?? CourseKind.all;
  }

  Future<void> setCourse(CourseKind course) async {
    await _prefs.setString(_courseKey, course.name);
  }

  DailyExerciseInfo? getDailyExerciseInfo() {
    final id = _prefs.getString(_dailyIdKey);
    final date = _prefs.getString(_dailyLastDateKey);
    if (id == null || date == null) {
      return null;
    }

    final idx = _prefs.getInt(_dailyIndexKey);

    return DailyExerciseInfo(
      exerciseId: id,
      lastDate: date,
      selectedIndex: idx,
    );
  }

  Future<void> saveDailyExerciseInfo(DailyExerciseInfo info) async {
    await _prefs.setString(_dailyIdKey, info.exerciseId);
    await _prefs.setString(_dailyLastDateKey, info.lastDate);
    if (info.selectedIndex != null) {
      await _prefs.setInt(_dailyIndexKey, info.selectedIndex!);
    }
  }
}