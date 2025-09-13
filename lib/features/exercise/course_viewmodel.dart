import 'package:flutter/foundation.dart';
import 'package:youkre_flutter/core/models/course.dart';

class CourseViewModel extends ChangeNotifier {
  final Course course;

  CourseViewModel(this.course);

  bool _loading = true;
}