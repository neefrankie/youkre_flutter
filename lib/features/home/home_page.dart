import 'package:flutter/material.dart';
import 'package:youkre_flutter/features/exercise/course_list_view.dart';

import '../quiz/daily_quiz_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        DailyQuizView(),
        ListTile(
          title: Text('更多练习'),
          contentPadding: EdgeInsets.zero,
        ),
        CourseListView(),
      ],
    );
  }
}



