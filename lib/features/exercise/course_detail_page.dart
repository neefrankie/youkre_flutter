import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';
import 'package:youkre_flutter/features/exercise/level_card.dart';
import 'package:youkre_flutter/features/exercise/level_detail_page.dart';

import '../../core/models/course.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({
    super.key,
    required this.course
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: CourseDetailView(course: course),
      )
    );
  }
}

class CourseDetailView extends StatefulWidget {
  final Course course;

  const CourseDetailView({
    super.key,
    required this.course
  });

  @override
  State<CourseDetailView> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailView> {


  @override
  Widget build(BuildContext context) {
    final levels = mockDate();

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: List.generate(levels.length, (index) {
        return LevelCard(
          index: index,
          level: levels[index],
          isCompleted: false,
          isLocked: false,
          onTap: () {
            onTapLevel(levels[index]);
          },
        );
      }),
    );
  }

  void onTapLevel(ExerciseLevel level) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => LevelDetailPage(
          course: widget.course, 
          level: level,
        ),
      ),
    );
  }

  List<ExerciseLevel> mockDate() {
    final List<ExerciseLevel> levels = [];
    for (var i = 0; i < 10; i++) {
      levels.add(ExerciseLevel(
          id: 'lvl-$i',
          courseID: widget.course.id,
          courseSlug: widget.course.slug,
          chapterID: 'chp-$i',
          chapterSlug: 'chp-$i',
          title: ''
      ));
    }
    return levels;
  }
}