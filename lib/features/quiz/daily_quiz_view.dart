import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youkre_flutter/core/models/course_kind.dart';
import 'package:youkre_flutter/core/services/preference_service.dart';

import '../../core/models/exercise.dart';
import '../../core/models/multiple_choice.dart';
import 'daily_quiz_card.dart';

class DailyQuizView extends StatefulWidget {
  const DailyQuizView({super.key});

  @override
  State<StatefulWidget> createState() => _DailyQuizViewState();
}

class _DailyQuizViewState extends State<DailyQuizView> {
  final _prefs = PreferenceService();

  bool _isLoading = false;

  final Exercise exercise = Exercise(
      id: "test",
      levelId: "test-level",
      prompts: r"""
\begin{align*}
\frac{dy}{dx} &= 2x \\
&= 2 \times 2 \\
&= 4
\end{align*}
""",
      multipleChoice: MultipleChoice(
          choices: [
            'Option 1',
            'Option 2',
            'Option 3',
            'Option 4',
          ],
          correctIndex: 0
      ),
      explanation: 'This part give you a detailed explanation on how to solve this problem.'
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _content()
    );
  }

  Widget _content() {
    return Column(
      children: [
        ListTile(
          title: Text('每日一题'),
          contentPadding: EdgeInsets.zero,
          trailing: IconButton(
            onPressed: () {
              _selectCourse();
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

  Future<void> _selectCourse() async {
    final selected = _prefs.getCourse();

    final result = await showDialog<CourseKind>(
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

    if (result != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('course', result.name);
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
}