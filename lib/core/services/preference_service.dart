import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';
import 'package:youkre_flutter/core/models/course_kind.dart';

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
}