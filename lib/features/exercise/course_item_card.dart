import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/ui/theme/app_colors.dart';

class CourseItemCard extends StatelessWidget {
  final Course course;
  final GestureTapCallback onTap;

  const CourseItemCard({
    super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();

    return Card(
      color: appColors?.contentBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: buildContent(),
        )
      ),
    );
  }

  Widget buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          course.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: SvgPicture.asset(
            course.exerciseCoverPath(),
            fit: BoxFit.contain,
          ),
          // child: Image.asset(
          //   course.exerciseCoverPath(),
          //   fit: BoxFit.contain,
          // ),
        ),
      ],
    );
  }
}