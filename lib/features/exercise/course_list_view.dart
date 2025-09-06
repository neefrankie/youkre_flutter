import 'package:flutter/material.dart';
import 'package:youkre_flutter/features/exercise/course_detail_page.dart';

import '../../core/models/course.dart';
import 'course_item_card.dart';

class CourseListView extends StatefulWidget {

  const CourseListView({super.key});

  @override
  State<CourseListView> createState() => _CourseListView();
}

class _CourseListView extends State<CourseListView> {
  bool _isLoading = true;
  String? error = null;
  
  List<Course> courses = [
    Course(
      id: "crs-5bd2c24bd901b5a9",
      slug: 'calculus-made-easy',
      title: '简易微积分',
      summary: '简单易懂的微积分',
      exerciseCover: 'calculus-made-easy.png'
    ),
    Course(
        id: 'crs-6b927048e42cc585',
        slug: 'elementary-algebra',
        title: '初级代数',
        summary: '用字母、数字和符号来“玩”的游戏',
        exerciseCover: 'elementary-algebra.png'
    ),
    Course(
        id: 'crs-ad7dd3035d82eda3',
        slug: 'elementary-statistics',
        title: '概率统计入门',
        summary: '预测事情发生的可能性，找出规律',
        exerciseCover: 'elementary-statistics.png'
    ),
    Course(
        id: 'crs-9b08c5f3f19338c4',
        slug: 'elementary-trigonometry',
        title: '三角函数',
        summary: '计算角度和距离',
        exerciseCover: 'elementary-trigonometry.png'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('更多练习'),
          contentPadding: EdgeInsets.zero,
        ),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: List.generate(courses.length, (index) {
            return CourseItemCard(
              course: courses[index],
              onTap: () {
                onTap(index);
              },
            );
          }),
        ),
      ],
    );
  }

  void onTap(int index) {
    Course course = courses[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailPage(course: course)
      )
    );
  }
}