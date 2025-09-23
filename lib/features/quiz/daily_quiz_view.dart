import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/models/course_kind.dart';
import 'package:youkre_flutter/features/quiz/models/daily_quiz_viewmodel.dart';

import 'daily_quiz_card.dart';

class DailyQuizView extends StatefulWidget {
  const DailyQuizView({super.key});

  @override
  State<StatefulWidget> createState() => _DailyQuizViewState();
}

class _DailyQuizViewState extends State<DailyQuizView> {
  final logger = Logger('DailyQuizView');
  CourseKind? _pendingNewCourse;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = DailyQuizViewModel();
        vm.getOrFindExercise();
        return vm;
      },
      child: Consumer<DailyQuizViewModel>(
        builder: (context, vm, child) {
          final newCourseKind = _pendingNewCourse;
          if (newCourseKind != null) {
            _pendingNewCourse = null;
            vm.switchCourse(newCourseKind);
          }

          if (vm.isLoading) {
            return const CircularProgressIndicator();
          }
          if (vm.error != null) {
            return Text('加载失败: ${vm.error}');
          }

          final exercise = vm.exercise;
          if (exercise != null) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('每日一题'),
                  contentPadding: EdgeInsets.zero,
                  trailing: IconButton(
                    onPressed: () {
                      _onSelectCourse(context);
                    },
                    icon: Icon(Icons.settings)
                  ),
                ),
                DailyQuizCard(
                  exercise: exercise,
                ),
              ],
            );
          }

          return Text('未知错误');
        }
      ),
    );
  }

  Future<void> _onSelectCourse(BuildContext context) async {
    final vm = context.read<DailyQuizViewModel>();
    final currentCourse = vm.currentCourseKind;
    logger.info('current course $currentCourse');

    final newCourseKind = await showDialog<CourseKind>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('选择课程'),
          children: CourseKind.values.map((course) {
            return SimpleDialogOption(
              onPressed: () { Navigator.pop(context, course); },
              child: buildOption(course.displayName, course == currentCourse),
            );
          }).toList(),
        );
      }
    );

    setState(() {
      _pendingNewCourse = newCourseKind;
    });
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
}