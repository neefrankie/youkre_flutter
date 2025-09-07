import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course_kind.dart';
import 'package:youkre_flutter/core/models/daily_exercise_info.dart';
import 'package:youkre_flutter/core/services/preference_service.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/utils/datetime.dart';

import 'daily_quiz_card.dart';

class DailyQuizView extends StatefulWidget {
  const DailyQuizView({super.key});

  @override
  State<StatefulWidget> createState() => _DailyQuizViewState();
}

class _DailyQuizViewState extends State<DailyQuizView> {
  final _prefs = PreferenceService();
  late Future<Exercise> _exerciseFuture;

  @override
  void initState() {
    super.initState();
    _exerciseFuture = _getOrFindExercise();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Exercise?>(
        future: _exerciseFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final exercise = snapshot.data!;
            return _buildExercise(exercise);
          }

          if (snapshot.hasError) {
            return Text('加载失败: ${snapshot.error}');
          }

          return CircularProgressIndicator();
        }
    );
  }

  Widget _buildExercise(Exercise exercise) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('每日一题'),
          contentPadding: EdgeInsets.zero,
          trailing: IconButton(
            onPressed: _selectCourse,
            icon: Icon(Icons.settings)
          ),
        ),
        DailyQuizCard(
          exercise: exercise,
        ),
      ],
    );
  }

  Future<void> _selectCourse() async {
    final selected = _prefs.getCourse();

    final newCourseKind = await showDialog<CourseKind>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('选择课程'),
          children: CourseKind.values.map((course) {
            return SimpleDialogOption(
              onPressed: () { Navigator.pop(context, course); },
              child: buildOption(course.displayName, course == selected),
            );
          }).toList(),
        );
      }
    );

    if (newCourseKind != null) {
      final currentKind = _prefs.getCourse();
      if (currentKind == newCourseKind) {
        return;
      }
      setState(() {
        _exerciseFuture = _onSwitchCourse(newCourseKind);
      });
    }
  }

  Widget buildOption(String title, bool selected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        if (selected) Icon(Icons.check, color: Colors.teal),
      ],
    );
  }

  Future<Exercise> _getOrFindExercise() async {
    final kind = _prefs.getCourse();
    final dailyExInfo = _prefs.getDailyExerciseInfo();

    if (dailyExInfo == null) {
      return await _loadNewDailyExercise(kind);
    }

    final String currentDate = getCurrentDateAsString();

    if (dailyExInfo.lastDate != currentDate) {
      return await _loadNewDailyExercise(kind);
    }

    return _loadTodayExercise(dailyExInfo.exerciseId, kind);
  }

  Future<Exercise> _onSwitchCourse(CourseKind kind) async {
    await _prefs.setCourse(kind);

    return _loadNewDailyExercise(kind);
  }

  Future<Exercise> _loadNewDailyExercise(CourseKind kind) async {
    final exercise = await ExerciseDataSource().findRandomExercise(kind);
    final dailyExInfo = DailyExerciseInfo.today(exerciseId: exercise.id);

    await _prefs.saveDailyExerciseInfo(dailyExInfo);

    return exercise;
  }

  Future<Exercise> _loadTodayExercise(String id, CourseKind kind) async {
    final currentExercise = await ExerciseDataSource().findExerciseById(id);

    if (currentExercise == null) {
      return await _loadNewDailyExercise(kind);
    }

    return currentExercise;
  }
}