import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/features/exercise/course_detail_page.dart';
import 'package:youkre_flutter/core/models/course.dart';

import 'course_item_card.dart';

class CourseListView extends StatefulWidget {

  const CourseListView({super.key});

  @override
  State<CourseListView> createState() => _CourseListView();
}

class _CourseListView extends State<CourseListView> {
  late Future<List<Course>> _coursesFuture;

  @override
  void initState() {
    super.initState();
    _coursesFuture = ExerciseDataSource().loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: _coursesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: List.generate(snapshot.data!.length, (index) {
              final course = snapshot.data![index];
              return CourseItemCard(
                course: course,
                onTap: () {
                  onTap(course);
                },
              );
            }),
          );
        }
        if (snapshot.hasError) {
          return Text('加载失败: ${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  void onTap(Course course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailPage(course: course)
      )
    );
  }
}